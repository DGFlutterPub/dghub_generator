import 'dart:convert';

import 'package:change_case/change_case.dart';

import '../../../../models/dg_api.dart';
import '../../../../models/dg_generator_config.dart';
import '../../../../models/dg_model_field.dart';
import '../../../../tools/tools.dart';

String updateProviderScript(DGGeneratorConfig config, DGApi api,
    List<DGModelField> models, String folder) {
  var fields = [];
  var files = [];
  var passwords = [];
  var inits = [];
  var success = [];

  var read = '''
import tools from '../../../system/tools/tools.js';
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
  
   var id = req.params["id"];
   
   /*file*/

   /*passwords*/
  
  /*init*/

 try{
var data = await ${folder.toPascalCase()}.findOneAndUpdate(
    {_id: id, /*auth*/},
    {/*field*/},
{ new: true }
  );
 var io = req.app.get('io');
 io.of('/${folder.toPascalCase()}').emit('update',data);

/*success*/
 
 return res.status(200).json(data);
 }catch(e){
  console.log(e);
  return res.status(200).json(e.message);
 }

}''';

  if (api.scripts.isNotEmpty) {
    for (var script in api.scripts) {
      if (script.init != null) {
        inits.add(script.init!);
      }
      if (script.success != null) {
        success.add(script.success!);
      }
    }
  }

  for (var model in models) {
    if (model.validate.isFile) {
      fields.add('''${model.key}: ${model.key} ,''');
    } else if (model.findToGetValueToJson) {
    } else if (model.validate.isPassword) {
      fields.add('''${model.key}: ${model.key} ,''');
      //  } else if (model.validate.isRoles) {
    } else {
      fields.add('''${model.key}: ${'req.body.${model.key}'} ,''');
    }

    if (model.update) {
      if (model.validate.isFile) {
        files.add('''
var ${model.key} = undefined;
if(req.files.${model.key}){
 var { error, value } = await tools.fileToStorage(req.files.${model.key}, {
    name: id,
    supports: ${jsonEncode(model.validate.fileExtensions)},
    path: "${folder.toSnakeCase()}/${model.key}/",
    size: ${model.validate.fileSize},
  });

  if (error) {
   return res.status(200).json(value);
  }
   ${model.key} = value;
  }
''');
      }

      if (model.validate.isPassword) {
        passwords.add('''
var ${model.key} = undefined;
if(req.body.${model.key}){
var { error, value } = await tools.createPassword(req.body.${model.key});
  if (error) {
    return res.status(200).json(value);
  }
  ${model.key} = value;
  }
''');
      }
    }
  }

  read = read
      .replaceAll('/*field*/', Tools.getNewLineString(fields))
      .replaceAll('/*file*/', Tools.getNewLineString(files))
      .replaceAll('/*passwords*/', Tools.getNewLineString(passwords))
      .replaceAll('/*init*/', Tools.getNewLineString(inits))
      .replaceAll('/*success*/', Tools.getNewLineString(success));

  return read;
}

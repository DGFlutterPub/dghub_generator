import 'dart:convert';

import 'package:change_case/change_case.dart';
import 'package:mason/mason.dart';

import '../../../../models/dg_api.dart';
import '../../../../models/dg_generator_config.dart';
import '../../../../models/dg_model_field.dart';
import '../../../../tools/tools.dart';

String storeProviderScript(DGGeneratorConfig config, DGApi api,
    List<DGModelField> models, String folder) {
  var imports = [];
  var fields = [];
  var files = [];
  var passwords = [];
  var inits = [];
  var success = [];
  var read = '''
import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';
/*import*/

export default async (req, res, next) => {
  
 var id = new mongoose.Types.ObjectId();

 
/*file*/

/*passwords*/

/*init*/

 try{
var data = await new ${folder.toPascalCase()}({
    _id: id,
    /*field*/
  }).save();

 var io = req.app.get('io');
 io.of('/${folder.toPascalCase()}').emit('store',data);
 /*success*/
 return res.status(200).json(data);
 }catch(e){
 console.log(e);
  return res.status(200).json(e.message);
 }

}''';

  if (api.controlAuthenticatedOnly) {
    fields.add('''auths: [req.auth.id] ,''');
  }

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
    if (model.store) {
      if (model.validate.isFile) {
        fields.add('''${model.key}: ${model.key} ,''');
      } else if (model.findToGetValueToJson) {
        if (model.ref != null) {
          imports.add(
              "import ${model.ref.toString().pascalCase} from '../../${model.ref.toString().snakeCase}/models/${model.ref.toString().snakeCase}.js';");
        }
        var query = '{/*query*/}';
        var queryFields = [];
        for (var q in model.findQuery) {
          if (q == 'auth') {
            queryFields.add('''auth: req.auth.id''');
          } else {
            queryFields.add('''$q: req.body.$q''');
          }
        }
        query =
            query.replaceAll('/*query*/', Tools.getNewLineString(queryFields));

        fields.add(
            '''${model.key}: JSON.stringify(await ${model.ref.toString().pascalCase}.find($query)) ,''');
      } else if (model.validate.isPassword) {
        fields.add('''${model.key}: ${model.key} ,''');
        //  } else if (model.validate.isRoles) {
      } else if (model.validate.isAuthenticatedId) {
        fields.add('''${model.key}: req.auth.id ,''');
      } else if (model.findToGetValue) {
        if (model.ref != null) {
          imports.add(
              "import ${model.ref.toString().pascalCase} from '../../${model.ref.toString().snakeCase}/models/${model.ref.toString().snakeCase}.js';");
        }
        fields.add('''${model.key}: ${'req.body.${model.key}'} ,''');
      } else {
        fields.add(
            '''${model.key}: await ${model.ref.toString().pascalCase}.find() ,''');
      }
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
var { error, value } = await tools.createPassword(req.body.${model.key});
  if (error) {
    return res.status(200).json(value);
  }
  var ${model.key} = value;
''');
      }
    }
  }

  read = read
      .replaceAll('/*field*/', Tools.getNewLineString(fields))
      .replaceAll('/*file*/', Tools.getNewLineString(files))
      .replaceAll('/*passwords*/', Tools.getNewLineString(passwords))
      .replaceAll('/*import*/', Tools.getNewLineString(imports))
      .replaceAll('/*init*/', Tools.getNewLineString(inits))
      .replaceAll('/*success*/', Tools.getNewLineString(success));

  return read;
}

import 'dart:convert';

import 'package:change_case/change_case.dart';

import '../../../models/dg_api.dart';
import '../../../models/dg_generator_config.dart';
import '../../../models/dg_model_field.dart';
import '../../../tools/tools.dart';

String storeProviderScript(DGGeneratorConfig config, DGApi api,
    List<DGModelField> models, String folder) {
  var fields = [];
  var files = [];
  var passwords = [];

  var read = '''
import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
  
 var id = new mongoose.Types.ObjectId();

 
/*file*/

/*passwords*/

 try{
var data = await new ${folder.toPascalCase()}({
    _id: id,
    /*field*/
  }).save();

 var io = req.app.get('io');
 io.of('/${folder.toPascalCase()}').emit('store',data);

 return res.status(200).json(data);
 }catch(e){
 console.log(e);
  return res.status(200).json('Store failed');
 }

}''';

  if (api.controlAuthenticatedOnly) {
    fields.add('''auths: [req.auth.id] ,''');
  }

  for (var model in models) {
    if (model.store) {
      if (model.validate.isFile) {
        fields.add('''${model.key}: ${model.key} ,''');
      } else if (model.validate.isPassword) {
        fields.add('''${model.key}: ${model.key} ,''');
        //  } else if (model.validate.isRoles) {
      } else if (model.validate.isAuthenticatedId) {
        fields.add('''${model.key}: req.auth.id ,''');
      } else {
        fields.add('''${model.key}: ${'req.body.${model.key}'} ,''');
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

  read = read.replaceAll('/*field*/', Tools.getNewLineString(fields));
  read = read.replaceAll('/*file*/', Tools.getNewLineString(files));
  read = read.replaceAll('/*passwords*/', Tools.getNewLineString(passwords));

  return read;
}

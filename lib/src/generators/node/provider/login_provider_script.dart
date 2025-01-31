import 'package:change_case/change_case.dart';

import '../../../models/dg_generator_config.dart';
import '../../../models/dg_model_field.dart';
import '../../../tools/tools.dart';

String loginProviderScript(
    DGGeneratorConfig config, List<DGModelField> models, String folder) {
  var fields = [];

  var read = '''
import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
  
 try{
var data = await ${folder.toPascalCase()}.findOne({email: req.body.email}).select("+password");

var { error, value } = tools.checkPassword(req.body.password,data.password);
if (error) return res.status(200).json(value);  
  
  var data = await Auth.findOneAndUpdate({email: data.email},{token: tools.getToken(data.id)},{ new: true }).select("-password");

 return res.status(200).json(data);
 }catch(e){
 console.log(e);
  return res.status(200).json('Login failed');
 }
}''';

  for (var model in models) {
    if (model.validate.isFile) {
      fields.add('''${model.key}: ${model.key} ,''');
    } else if (model.validate.isPassword) {
      fields.add('''${model.key}: ${model.key} ,''');
    } else {
      fields.add('''${model.key}: ${'req.body.${model.key}'} ,''');
    }

    read = read.replaceAll('/*field*/', Tools.getNewLineString(fields));
  }
  return read;
}

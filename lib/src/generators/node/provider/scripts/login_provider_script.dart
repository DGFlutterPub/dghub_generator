import 'package:change_case/change_case.dart';

import '../../../../models/dg_generator_config.dart';
import '../../../../models/dg_model_field.dart';
import '../../../../tools/tools.dart';

String loginProviderScript(
    DGGeneratorConfig config, List<DGModelField> models, String folder) {
  var fields = [];
  var checkFields = [];

  var read = '''
import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
  
 try{
var data = await ${folder.toPascalCase()}.findOne({
/*checkField*/
}).select("+password");

var { error, value } = tools.checkPassword(req.body.password,data.password);
if (error) return res.status(200).json(value);  
  
  var data = await ${folder.toPascalCase()}.findOneAndUpdate({
  /*field*/
  },{token: tools.getToken(data.id)},{ new: true }).select("-password");

 return res.status(200).json(data);
 }catch(e){
 console.log(e);
  return res.status(200).json(e.message);
 }
}''';

  for (var model in models) {
    if (model.loginForm) {
      fields.add('''${model.key}: ${'data.${model.key}'} ,''');
      checkFields.add('''${model.key}: ${'req.body.${model.key}'} ,''');
    }
  }
  read = read
      .replaceAll('/*field*/', Tools.getNewLineString(fields))
      .replaceAll('/*checkField*/', Tools.getNewLineString(checkFields));
  return read;
}

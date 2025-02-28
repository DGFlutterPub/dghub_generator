import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/models/dg_generator_config.dart';
import '../../../../models/dg_api.dart';
import '../../../../models/dg_model_field.dart';

String destroyAllForeverProviderScript(DGGeneratorConfig config, DGApi api,
    List<DGModelField> models, String folder) {
  var read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';


export default async (req, res, next) => {
   try{
 await ${folder.toPascalCase()}.deleteMany(/*auth*/);
   return res.status(200).json(true);
 }catch(e){
  return res.status(200).json('Delete failed');
 }
}''';
  if (api.controlAuthenticatedOnly) {
    read = read.replaceAll('/*auth*/', '{auths: {\$in: [req.auth.id]}}');
  }
  return read;
}

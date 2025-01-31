import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/models/dg_generator_config.dart';
import '../../../models/dg_api.dart';
import '../../../models/dg_model_field.dart';

String destroyAllProviderScript(DGGeneratorConfig config, DGApi api,
    List<DGModelField> models, String folder) {
  var read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';


export default async (req, res, next) => {
   try{
 await ${folder.toPascalCase()}.deleteMany(/*auth*/);
   return res.status(200).json({
            data: [],
            total: 0,
            currentPage: 1,
            totalPage: 1,
          });
 }catch(e){
  return res.status(200).json('Delete failed');
 }
}''';
  if (api.controlAuthenticatedOnly) {
    read = read.replaceAll('/*auth*/', '{auths: {\$in: [req.auth.id]}}');
  }
  return read;
}

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/src/models/dg_generator_config.dart';
import 'package:dghub_generator/src/models/dg_model_field.dart';

import '../../../../models/dg_api.dart';

String destroyProviderScript(DGGeneratorConfig config, DGApi api,
    List<DGModelField> models, String folder) {
  String body = '';
  String read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
  var id = req.params["id"];

   try{

   /*body*/

 

 }catch(e){
  return res.status(200).json('Delete failed');
 }


}''';

  if (config.deletedAt) {
    body =
        '''var data = await ${folder.toPascalCase()}.findOneAndUpdate({_id: id, /*auth*/},{deletedAt: Date.now()});
return res.status(200).json(data);''';

    if (api.controlAuthenticatedOnly) {
      body = body.replaceAll('/*auth*/', 'auths: {\$in: [req.auth.id]}');
    }
  } else {
    body =
        '''var data = await ${folder.toPascalCase()}.deleteOne({_id: id, /*auth*/});

 return res.status(200).json(data);''';
    if (api.controlAuthenticatedOnly) {
      body = body.replaceAll('/*auth*/', 'auths: {\$in: [req.auth.id]}');
    }
  }

  read = read.replaceAll('/*body*/', body);

  return read;
}

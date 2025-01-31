import 'package:change_case/change_case.dart';

import '../../../models/dg_api.dart';

String destroyForerverProviderScript(String folder, DGApi api) {
  var read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
   var id = req.params["id"];

   try{
 var data = await ${folder.toPascalCase()}.deleteOne({_id: id, /*auth*/});

 return res.status(200).json(data);
   
 }catch(e){
  return res.status(200).json('Delete failed');
 }
}''';

  if (api.controlAuthenticatedOnly) {
    read = read.replaceAll('/*auth*/', 'auths: {\$in: [req.auth.id]}');
  }
  return read;
}

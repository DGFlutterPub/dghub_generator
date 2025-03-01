import 'package:change_case/change_case.dart';

import '../../../../models/dg_api.dart';

String getOneProviderScript(String folder, DGApi api) {
  var read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next)  => {
  var ${api.getOneKey} = req.params["${api.getOneKey}"];
 

 try{
 var data = await ${folder.toPascalCase()}.findOne({ ${(api.getOneKey == 'id' ? '_id' : api.getOneKey)}: ${api.getOneKey},/*auth*/ }).exec();
return res.json(data);
 }catch(e){
 return res.status(200).json("This ${folder.toPascalCase()} is not exists" );
 }
 
 
   
}''';

  if (api.controlAuthenticatedOnly) {
    read = read.replaceAll('/*auth*/', 'auths: {\$in: [req.auth.id]} ');
  }

  return read;
}

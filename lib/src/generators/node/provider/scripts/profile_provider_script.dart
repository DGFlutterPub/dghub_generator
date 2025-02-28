import 'package:change_case/change_case.dart';

String profileProviderScript(String folder) => '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next)  => {
 try{
 var data = req.auth;
return res.json(data);
 }catch(e){
 return res.status(200).json("This ${folder.toPascalCase()} is not exists" );
 }
 

}''';

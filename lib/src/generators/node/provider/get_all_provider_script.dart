import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';

import '../../../tools/tools.dart';

String getAllProviderScript(DGGeneratorConfig config, DGApi api,
    List<DGModelField> models, String folder) {
  var searchFields = [];

  var read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';
 
export default async (req, res, next) => {
  
try{

var search = {\$or: [],\$and: []};

 /*searchField*/

  var total = await ${folder.toPascalCase()}.countDocuments(search);
  var page = parseInt(req.query.page) || 1;
  var limit = 20;
  var startIndex = page * limit - limit;

 var data = await ${folder.toPascalCase()}.find(search)
    .sort("-_id")
    .skip(startIndex)
    .limit(limit, total); 

      return res.status(200).json({
        data: data,
        total: total,
        currentPage: page,
        totalPage: Math.ceil(total / limit),
      });

}catch(e){
 return res.status(200).json('Get all failed');
}


}''';

  if (config.deletedAt) {
    searchFields.add('''search.\$and.push({deletedAt: null});''');
  }

  if (api.controlAuthenticatedOnly) {
    searchFields.add('''
search.\$and.push({auths: {\$in: [req.auth.id]}});
''');
  }

  for (var model in models) {
    if (model.validate.isString) {
      searchFields.add('''
if(req.query.search || req.query.${model.key}){
search.\$and.push({${model.key}: {\$regex:req.query.search || req.query.${model.key} || '',\$options: 'i' }});
}''');
    } else {
      searchFields.add('''
if(req.query.${model.key}){
  search.\$and.push({${model.key}: req.query.${model.key} || null});
  }
  ''');
    }
  }

  read =
      read.replaceAll('/*searchField*/', Tools.getNewLineString(searchFields));

  return read;
}

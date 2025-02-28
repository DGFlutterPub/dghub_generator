import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';

import '../../../../tools/tools.dart';

String getAllProviderScript(DGGeneratorConfig config, DGApi api,
    List<DGModelField> models, String folder) {
  var searchFields = [];
  var findToGetValueToJsons = [];

  var inits = [];
  var success = [];

  var read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';
 
export default async (req, res, next) => {
  
try{

var search = {\$or: [],\$and: []};

 /*searchField*/

 

  var total = await ${folder.toPascalCase()}.countDocuments(search);
 
 /*itemLimit*/

 /*init*/
 
  var page = parseInt(req.query.page) || 1;
  var limit = ${config.paginationSize};
  var startIndex = page * limit - limit;

 var data = await ${folder.toPascalCase()}.find(search)
    .sort("-_id")
    .skip(startIndex)
    .limit(limit, total); 
      var replaced = [];
      for(var d of data){
      /*findToGetValueToJson*/
      }
      /*success*/
      return res.status(200).json({
        data: replaced.length == 0? data : replaced,
        total: total,
        currentPage: page,
        totalPage: Math.ceil(total / limit),
      });

}catch(e){
 return res.status(200).json('Get all failed');
}


}''';

  if (config.itemLimit != 0) {
    read = read.replaceAll('/*itemLimit*/', '''
if(total >= ${config.itemLimit}){
 return res.status(200).json('Limited item. supported ${config.itemLimit} only.');
}
''');
  }

  if (config.deletedAt) {
    searchFields.add('''search.\$and.push({deletedAt: null});''');
  }

  if (api.controlAuthenticatedOnly) {
    searchFields.add('''
search.\$and.push({auths: {\$in: [req.auth.id]}});
''');
  }

  if (api.scripts.isNotEmpty) {
    for (var script in api.scripts) {
      if (script.init != null) {
        inits.add(script.init!);
      }
      if (script.success != null) {
        success.add(script.success!);
      }
    }
  }

  for (var model in models) {
    if (model.findToGetValueToJson) {
      findToGetValueToJsons.add('d.${model.key} = JSON.parse(d.${model.key})');
    }

    if (model.validate.isString && model.findWithSearch) {
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

  read = read
      .replaceAll('/*searchField*/', Tools.getNewLineString(searchFields))
      .replaceAll('/*init*/', Tools.getNewLineString(inits))
      .replaceAll('/*success*/', Tools.getNewLineString(success))
      .replaceAll('/*findToGetValueToJson*/',
          Tools.getNewLineString(findToGetValueToJsons));

  return read;
}

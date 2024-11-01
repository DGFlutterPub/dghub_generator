import 'dart:convert';
import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/models/dg_generator_config.dart';
import 'package:mason/mason.dart';

import '../../bundles/module/node/node_module_bundle.dart';
import '../../tools/tools.dart';

class NodeProviderGenerator {
  static Future<void> generate(
    String folder,
    String name,
    DGApi api,
    DGGeneratorConfig config,
    List<DGModelField> models,
  ) async {
    final generator = await MasonGenerator.fromBundle(nodeProviderBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator
        .generate(target, vars: {'folder': folder, 'name': name});

    var file = File(generated.first.path);

    var read = '';

    if (api.action == DGApiAction.getOne) {
      read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next)  => {
  var id = req.params["id"];
 

 try{
 var data = await ${folder.toPascalCase()}.findOne({ _id: id }).exec();
return res.json(data);
 }catch(e){
 return res.status(200).json("This ${folder.toPascalCase()} is not exists" );
 }
 
 
   
}''';
    }

    if (api.action == DGApiAction.getAll) {
      var searchFields = [];

      read = '''
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

      read = read.replaceAll(
          '/*searchField*/', Tools.getNewLineString(searchFields));
    }

    if (api.action == DGApiAction.store) {
      var fields = [];
      var files = [];

      read = '''
import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
  
 var id = new mongoose.Types.ObjectId();

 
/*file*/

 try{
var data = await new ${folder.toPascalCase()}({
    _id: id,
    /*field*/
  }).save();

 return res.status(200).json(data);
 }catch(e){
 console.log(e);
  return res.status(200).json('Store failed');
 }

}''';

      for (var model in models) {
        if (model.store) {
          fields.add(
              '''${model.key}: ${model.validate.isFile ? model.key : 'req.body.${model.key}'} ,''');

          if (model.validate.isFile) {
            files.add('''
 var { error, value } = await tools.fileToStroage(req.files.${model.key}, {
    name: id,
    supports: ${jsonEncode(model.validate.fileExtensions)},
    path: "${folder.toSnakeCase()}/${model.key}/",
    size: ${model.validate.fileSize},
  });

  if (error) {
   return res.status(200).json(value);
  }
  var ${model.key} = value;
''');
          }
        }
      }

      read = read.replaceAll('/*field*/', Tools.getNewLineString(fields));
      read = read.replaceAll('/*file*/', Tools.getNewLineString(files));
    }

    if (api.action == DGApiAction.update) {
      var fields = [];
      var files = [];
      read = '''
import tools from '../../../system/tools/tools.js';
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
  
   var id = req.params["id"];

   /*file*/

 try{
var data = await ${folder.toPascalCase()}.findOneAndUpdate(
    {_id: id},
    {/*field*/}
  );
 return res.status(200).json(data);
 }catch(e){
  console.log(e);
  return res.status(200).json('Update failed');
 }

}''';
      for (var model in models) {
        fields.add('''${model.key}: req.body.${model.key},''');
        if (model.update) {
          if (model.validate.isFile) {
            files.add('''
var ${model.key} = null;
if(req.files.${model.key}){
 var { error, value } = await tools.fileToStroage(req.files.${model.key}, {
    name: id,
    supports: ${jsonEncode(model.validate.fileExtensions)},
    path: "${folder.toSnakeCase()}/${model.key}/",
    size: ${model.validate.fileSize},
  });

  if (error) {
   return res.status(200).json(value);
  }
   ${model.key} = value;
  }
''');
          }
        }
      }

      read = read.replaceAll('/*field*/', Tools.getNewLineString(fields));
      read = read.replaceAll('/*file*/', Tools.getNewLineString(files));
    }

    if (api.action == DGApiAction.destroy) {
      String body;
      read = '''
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
            '''var data = await ${folder.toPascalCase()}.findOneAndUpdate({_id: id},{deletedAt: Date.now()});
return res.status(200).json(data);''';
      } else {
        body =
            '''var data = await ${folder.toPascalCase()}.deleteOne({_id: id});

 return res.status(200).json(data);''';
      }

      read = read.replaceAll('/*body*/', body);
    }

    if (api.action == DGApiAction.destroyAll) {
      read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';


export default async (req, res, next) => {
   try{
 await ${folder.toPascalCase()}.deleteMany();
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
    }

    if (api.action == DGApiAction.destroyForever) {
      read = '''
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
   var id = req.params["id"];

   try{
 var data = await ${folder.toPascalCase()}.deleteOne({_id: id});

 return res.status(200).json(data);
   
 }catch(e){
  return res.status(200).json('Delete failed');
 }
}''';
    }

    if (api.action == DGApiAction.register) {
      var fields = [];
      var files = [];
      var passwords = [];

      read = '''
import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
  
 var id = new mongoose.Types.ObjectId();

/*passwords*/
 
/*file*/

 try{
var data = await new Auth({
    _id: id,
    /*field*/

  }).save();

 return res.status(200).json(data);
 }catch(e){
 console.log(e);
  return res.status(200).json('Register failed');
 }

}''';

      for (var model in models) {
        if (model.store) {
          if (model.validate.isFile) {
            fields.add('''${model.key}: ${model.key} ,''');
          } else if (model.validate.isPassword) {
            fields.add('''${model.key}: ${model.key} ,''');
          } else if (model.validate.isRoles) {
          } else if (model.validate.isToken) {
            fields.add('''${model.key}: tools.getToken(id),''');
          } else {
            fields.add('''${model.key}: ${'req.body.${model.key}'} ,''');
          }

          if (model.validate.isFile) {
            files.add('''
 var { error, value } = await tools.fileToStroage(req.files.${model.key}, {
    name: id,
    supports: ${jsonEncode(model.validate.fileExtensions)},
    path: "${folder.toSnakeCase()}/${model.key}/",
    size: ${model.validate.fileSize},
  });

  if (error) {
   return res.status(200).json(value);
  }
  var ${model.key} = value;
''');
          }
          if (model.validate.isPassword) {
            passwords.add('''
var { error, value } = await tools.createPassword(req.body.${model.key});
  if (error) {
    return res.status(200).json(value);
  }
  var ${model.key} = value;
''');
          }
        }
      }
      read =
          read.replaceAll('/*passwords*/', Tools.getNewLineString(passwords));
      read = read.replaceAll('/*field*/', Tools.getNewLineString(fields));
      read = read.replaceAll('/*file*/', Tools.getNewLineString(files));
    }

    if (api.action == DGApiAction.login) {
      var fields = [];

      read = '''
import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import ${folder.toPascalCase()} from '../models/${folder.toSnakeCase()}.js';

export default async (req, res, next) => {
  
 try{
var data = await ${folder.toPascalCase()}.findOne({email: req.body.email}).select("+password");

var { error, value } = tools.checkPassword(req.body.password,data.password);
if (error) return res.status(200).json(value);  
  
  var data = await Auth.findOne({email: data.email},{token: tools.getToken()}).select("-password").update();

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
    }
    await file.writeAsString(read);
  }
}

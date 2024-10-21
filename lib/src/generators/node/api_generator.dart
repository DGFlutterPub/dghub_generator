import 'dart:convert';
import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/generators/node/provider_generator.dart';
import 'package:dghub_generator/src/generators/node/route_generator.dart';
import 'package:dghub_generator/src/models/dg_generator_config.dart';
import 'package:mason/mason.dart';

import '../../bundles/module/node/node_module_bundle.dart';
import '../../tools/tools.dart';

class NodeApiGenerator {
  static Future<void> generate(
    String className,
    DGGeneratorConfig config,
    List<DGApi> apis,
    List<DGModel> models,
  ) async {
    final generator = await MasonGenerator.fromBundle(nodeApiBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator.generate(target, vars: {'name': className});

    var file = File(generated.first.path);

    var read = await file.readAsString();

    var form = [];
    var import = [];

    await NodeApiRouteGenerator.generate(className);

    import.add(
        '''import authenticated from '../../../middleware/api/authenticated.js';''');
    import.add('''import roles from '../../../middleware/api/roles.js';''');

    for (var api in apis) {
      var classPathName = Tools.getClassPathName(className, api);

      if (api.action == DGApiAction.getOne) {
        await NodeProviderGenerator.generate(
            className, classPathName, api, config, models);
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';
        import.add(
            '''import ${classPathName.toPascalCase()}Provider from '../providers/${className.toSnakeCase()}_provider.js';''');

        form.add(
            '''router.${api.method.name}("/${classPathName.toSnakeCase()}" ,$authenticated $roles ${api.roles.isEmpty ? '' : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),'} ${className.toPascalCase()}Provider);''');
      }
      if (api.action == DGApiAction.store) {
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';

        await NodeProviderGenerator.generate(
            className, classPathName, api, config, models);
        import.add(
            '''import ${classPathName.toPascalCase()}Provider from '../providers/${classPathName.toSnakeCase()}_provider.js';''');
        form.add(
            '''router.${api.method.name}("/${classPathName.toSnakeCase()}",$authenticated $roles ${classPathName.toPascalCase()}Provider);''');
      }

      if (api.action == DGApiAction.update) {
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';
        await NodeProviderGenerator.generate(
            className, classPathName, api, config, models);
        import.add(
            '''import ${classPathName.toPascalCase()}Provider from '../providers/${classPathName.toSnakeCase()}_provider.js';''');
        form.add(
            '''router.${api.method.name}("/${classPathName.toSnakeCase()}/:id", $authenticated $roles ${classPathName.toPascalCase()}Provider);''');
      }

      if (api.action == DGApiAction.destroy) {
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';

        await NodeProviderGenerator.generate(
            className, classPathName, api, config, models);
        import.add(
            '''import ${classPathName.toPascalCase()}Provider from '../providers/${classPathName.toSnakeCase()}_provider.js';''');
        form.add(
            '''router.${api.method.name}("/${classPathName.toSnakeCase()}/:id",$authenticated $roles ${classPathName.toPascalCase()}Provider);''');
      }

      if (api.action == DGApiAction.destroyForever) {
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';
        await NodeProviderGenerator.generate(
            className, classPathName, api, config, models);
        import.add(
            '''import ${classPathName.toPascalCase()}Provider from '../providers/${classPathName.toSnakeCase()}_provider.js';''');
        form.add(
            '''router.${api.method.name}("/${classPathName.toSnakeCase()}/:id",$authenticated $roles  ${classPathName.toPascalCase()}Provider);''');
      }

      if (api.action == DGApiAction.getAll) {
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';

        await NodeProviderGenerator.generate(
            className, classPathName, api, config, models);
        import.add(
            '''import ${classPathName.toPascalCase()}Provider from '../providers/${classPathName.toSnakeCase()}_provider.js';''');
        form.add(
            '''router.${api.method.name}("/${classPathName.toSnakeCase()}",$authenticated $roles  ${classPathName.toPascalCase()}Provider);''');
      }
    }

    var formResult = Tools.getNewLineString(form);
    var importResult = Tools.getNewLineString(import);

    read = read.replaceAll('/*form*/', formResult);
    read = read.replaceAll('/*import*/', importResult);

    await file.writeAsString(read);
  }
}

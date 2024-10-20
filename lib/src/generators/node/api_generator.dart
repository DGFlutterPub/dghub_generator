import 'dart:convert';
import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/generators/node/provider_generator.dart';
import 'package:dghub_generator/src/generators/node/route_generator.dart';
import 'package:mason/mason.dart';

import '../../bundles/module/node/node_module_bundle.dart';
import '../../tools/tools.dart';

class NodeApiGenerator {
  static Future<void> generate(
    String className,
    DGConfig config,
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
      if (api.action == DGApiAction.getOne) {
        await NodeProviderGenerator.generate(
            className, className, api, config, models);
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';
        import.add(
            '''import ${className.toPascalCase()}Provider from '../providers/${className.toSnakeCase()}_provider.js';''');

        form.add(
            '''router.${api.method.name}("/${className.toSnakeCase()}/:id",$authenticated $roles ${api.roles.isEmpty ? '' : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),'} ${className.toPascalCase()}Provider);''');
      }
      if (api.action == DGApiAction.store) {
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';

        await NodeProviderGenerator.generate(
            className, '${className}_store', api, config, models);
        import.add(
            '''import ${className.toPascalCase()}StoreProvider from '../providers/${className.toSnakeCase()}_store_provider.js';''');
        form.add(
            '''router.${api.method.name}("/${className.toSnakeCase()}",$authenticated $roles ${className.toPascalCase()}StoreProvider);''');
      }

      if (api.action == DGApiAction.update) {
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';
        await NodeProviderGenerator.generate(
            className, '${className}_update', api, config, models);
        import.add(
            '''import ${className.toPascalCase()}UpdateProvider from '../providers/${className.toSnakeCase()}_update_provider.js';''');
        form.add(
            '''router.${api.method.name}("/${className.toSnakeCase()}/:id", $authenticated $roles ${className.toPascalCase()}UpdateProvider);''');
      }

      if (api.action == DGApiAction.destroy) {
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';

        await NodeProviderGenerator.generate(
            className, '${className}_destroy', api, config, models);
        import.add(
            '''import ${className.toPascalCase()}DestroyProvider from '../providers/${className.toSnakeCase()}_destroy_provider.js';''');
        form.add(
            '''router.${api.method.name}("/${className.toSnakeCase()}/:id",$authenticated $roles ${className.toPascalCase()}DestroyProvider);''');
      }

      if (api.action == DGApiAction.destroyForever) {
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';
        await NodeProviderGenerator.generate(
            className, '${className}_destroy_forever', api, config, models);
        import.add(
            '''import ${className.toPascalCase()}DestroyForeverProvider from '../providers/${className.toSnakeCase()}_destroy_forever_provider.js';''');
        form.add(
            '''router.${api.method.name}("/${className.toSnakeCase()}/:id",$authenticated $roles  ${className.toPascalCase()}DestroyForeverProvider);''');
      }

      if (api.action == DGApiAction.getAll) {
        var authenticated = api.authenticated ? 'authenticated,' : '';
        var roles = api.roles.isEmpty
            ? ''
            : '(req,res,next)=>roles(req,res,next,${jsonEncode(api.roles)}),';

        await NodeProviderGenerator.generate(
            className, className.toPlural(), api, config, models);
        import.add(
            '''import ${className.toPascalCase().toPlural()}Provider from '../providers/${className.toSnakeCase().toPlural()}_provider.js';''');
        form.add(
            '''router.${api.method.name}("/${className.toSnakeCase().toPlural()}",$authenticated $roles  ${className.toPascalCase().toPlural()}Provider);''');
      }
    }

    var formResult = Tools.getNewLineString(form);
    var importResult = Tools.getNewLineString(import);

    read = read.replaceAll('/*form*/', formResult);
    read = read.replaceAll('/*import*/', importResult);

    await file.writeAsString(read);
  }
}

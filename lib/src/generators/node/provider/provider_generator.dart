import 'dart:convert';
import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/generators/node/provider/scripts/destroy_all_provider_script.dart';
import 'package:dghub_generator/src/generators/node/provider/scripts/destroy_forever_provider_script.dart';
import 'package:dghub_generator/src/generators/node/provider/scripts/destroy_provider_script.dart';
import 'package:dghub_generator/src/generators/node/provider/scripts/get_all_provider_script.dart';
import 'package:dghub_generator/src/generators/node/provider/scripts/get_one_provider_script.dart';
import 'package:dghub_generator/src/generators/node/provider/scripts/login_provider_script.dart';
import 'package:dghub_generator/src/generators/node/provider/scripts/register_provider_script.dart';
import 'package:dghub_generator/src/generators/node/provider/scripts/store_provider_script.dart';
import 'package:dghub_generator/src/generators/node/provider/scripts/update_provider_script.dart';
import 'package:dghub_generator/src/models/dg_generator_config.dart';
import 'package:mason/mason.dart';

import '../../../bundles/module/node/node_module_bundle.dart';
import '../../../tools/tools.dart';
import 'scripts/destroy_all_forever_provider_script.dart';
import 'scripts/profile_provider_script.dart';

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
      read = getOneProviderScript(folder, api);
    }

    if (api.action == DGApiAction.getAll) {
      read = getAllProviderScript(config, api, models, folder);
    }

    if (api.action == DGApiAction.store) {
      read = storeProviderScript(config, api, models, folder);
    }

    if (api.action == DGApiAction.update) {
      read = updateProviderScript(config, api, models, folder);
    }

    if (api.action == DGApiAction.destroy) {
      read = destroyProviderScript(config, api, models, folder);
    }

    if (api.action == DGApiAction.destroyAll) {
      read = destroyAllProviderScript(config, api, models, folder);
    }

    if (api.action == DGApiAction.destroyAllForever) {
      read = destroyAllForeverProviderScript(config, api, models, folder);
    }
    if (api.action == DGApiAction.destroyForever) {
      read = destroyForerverProviderScript(folder, api);
    }

    if (api.action == DGApiAction.register) {
      read = registerProviderScript(config, models, folder);
    }

    if (api.action == DGApiAction.login) {
      read = loginProviderScript(config, models, folder);
    }

    if (api.action == DGApiAction.profile) {
      read = profileProviderScript(folder);
    }

    await file.writeAsString(read);
  }
}

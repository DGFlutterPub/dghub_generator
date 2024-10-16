
import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/tools/tools.dart';
import 'package:mason/mason.dart';

class DartFormGenerator {
  static Future<void> generate(String className, List<DGModel> models) async {
    for (var model in models) {
      if (model.forms.isNotEmpty) {
        var remodel = [];
        for (var form in model.forms) {
          remodel = models.where((e) => e.forms.contains(form)).toList();
        }
        print(remodel);
      }
    }
/*
    final generator = await MasonGenerator.fromBundle(dartFormBundle);
    var target = DirectoryGeneratorTarget(Directory.current);
    var generated = await generator.generate(target, vars: {'name': className});

    var file = File(generated.first.path);

    var read = await file.readAsString();

    print(read);

    var form = [];
    var formParameter = [];

    form.add('int page;');
    formParameter.add('this.page = 1,');

    form.add('String? search;');
    formParameter.add('this.search,');

    for (var model in models) {
      formParameter.add('this.${model.key},');

      form.add('String? ${model.key};');
    }
    var formResult = Tools.getNewLineString(form);
    var formParameterResult = Tools.getNewLineString(formParameter);

    read = read.replaceAll('/*form*/', formResult);

    read = read.replaceAll('/*formParameter*/', formParameterResult);

    await file.writeAsString(read);*/
  }
}

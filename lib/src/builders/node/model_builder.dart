import 'dart:math';

import 'package:analyzer/dart/constant/value.dart';
import 'package:change_case/change_case.dart';
import 'package:code_builder/code_builder.dart';

class ModelBuilder {
  String name;
  DartObject? config;
  List<String> imports;
  List<DartObject> models;

  ModelBuilder({
    required this.name,
    this.config,
    required this.imports,
    required this.models,
  });

  String get() {
    StringBuffer buffer = StringBuffer(
      '{ _id: mongoose.Schema.Types.ObjectId,',
    );

    var isDeletedAt = config?.getField('deletedAt')?.toBoolValue() ?? false;
    if (isDeletedAt) {
      buffer.writeln('deletedAt: { type: Date, default: null },');
    }

    for (var e in models) {
      var key = e.getField('key')!.toStringValue()!.toCamelCase();
      var defaultValue = e.getField('defaultValue');
      var type = e.getField('type')?.toTypeValue();

      buffer.writeln('''
$key: {
    type: String,
    required: ${defaultValue?.isNull ?? true},
    default: ${defaultValue == null ? null : "\"${defaultValue.toStringValue()}\""},
  },''');
    }

    final library = Library((b) {
      b.body.addAll([
        const Code('import mongoose from "mongoose";'),
        const Code('const schema = mongoose.Schema('),
        Code('${buffer.toString()}})'),
        Code('export default mongoose.model("$name", schema);'),
      ]);
    });

    // Emitting code
    final emitter = DartEmitter();
    final output = '${library.accept(emitter)}';
    return output;
  }
}

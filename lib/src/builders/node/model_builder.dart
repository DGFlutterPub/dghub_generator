import 'package:analyzer/dart/constant/value.dart';
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
    final library = Library((b) {
      b.body.addAll([
        const Code('import mongoose from "mongoose";'),
        const Code('const schema = mongoose.Schema('),
        Block((b) {
          b.addExpression(
            const CodeExpression(
              Code(
                '''
{
  _id: mongoose.Schema.Types.ObjectId,
  deletedAt: { type: Date, default: null },
  email: {
    type: String,
    required: false,
    lowercase: true,
    index: {
      unique: true,
      partialFilterExpression: { email: { \$type: "string" } },
    },
    default: null,
  },
  token: {
    autopopulate: true,
    type: String, 
    ref: 'AuthToken',
    default: null, 
    required: false, 
    trim: true
  },
})
  ''',
              ),
            ),
          );
        }),
        const Code('export default mongoose.model("Auth", schema);'),
      ]);
    });

    // Emitting code
    final emitter = DartEmitter();
    final output = '${library.accept(emitter)}';
    return output;
  }
}

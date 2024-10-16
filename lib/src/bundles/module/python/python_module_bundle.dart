import 'package:mason/mason.dart';

final pythonModelBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path": "python/gen/{{name.snakeCase()}}/models/{{name.snakeCase()}}.py",
      "data": "",
      "type": "text"
    }
  ],
  "name": "python_model",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
  }
});

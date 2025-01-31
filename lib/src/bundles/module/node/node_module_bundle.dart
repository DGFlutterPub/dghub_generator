import 'package:mason/mason.dart';

final nodeModelBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path": "node/gen/{{name.snakeCase()}}/models/{{name.snakeCase()}}.js",
      "data":
          "aW1wb3J0IG1vbmdvb3NlIGZyb20gIm1vbmdvb3NlIjsKLyppbXBvcnQqLwoKY29uc3Qgc2NoZW1hID0gbW9uZ29vc2UuU2NoZW1hKHsKICBfaWQ6IG1vbmdvb3NlLlNjaGVtYS5UeXBlcy5PYmplY3RJZCwKICAvKmZvcm0qLwp9LAp7CiAgICB0aW1lc3RhbXBzOiBmYWxzZSwKICAgIHZlcnNpb25LZXk6IGZhbHNlLAogICAgdG9KU09OOiB7CiAgICAgIHRyYW5zZm9ybShkb2MsIHJldCkgewogICAgICAgIHJldC5pZCA9IHJldC5faWQ7CiAgICAgICAgLy8gZGVsZXRlIHJldC5faWQ7Ci8qaGlkZSovCiAgICAgIH0sCiAgICB9LAogICAgdG9PYmplY3Q6IHsKICAgICAgdHJhbnNmb3JtKGRvYywgcmV0KSB7CiAgICAgICAgcmV0LmlkID0gcmV0Ll9pZDsKICAgICAgLy8gIGRlbGV0ZSByZXQuX2lkOwogICAgICB9LAogICAgfSwKICB9KTsKCi8qdW5pcXVlKi8KCnNjaGVtYS5wcmUoJ3NhdmUnLCBmdW5jdGlvbihuZXh0KSB7Ci8qcHJlU2F2ZSovCiAgICBuZXh0KCk7Cn0pOwoKLypwbHVnaW4qLwpleHBvcnQgZGVmYXVsdCBtb25nb29zZS5tb2RlbCgie3tuYW1lLnBhc2NhbENhc2UoKX19Iiwgc2NoZW1hKTs=",
      "type": "text"
    }
  ],
  "name": "node_model",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
  }
});

final nodeApiBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path": "node/gen/{{name.snakeCase()}}/apis/{{name.snakeCase()}}_api.js",
      "data":
          "aW1wb3J0IGV4cHJlc3MgZnJvbSAiZXhwcmVzcyI7CmNvbnN0IHJvdXRlciA9IGV4cHJlc3MuUm91dGVyKCk7CgovKmltcG9ydCovCgovKmZvcm0qLwoKZXhwb3J0IGRlZmF1bHQgcm91dGVyOw==",
      "type": "text"
    }
  ],
  "name": "node_api",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
  }
});

final nodeProviderBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path":
          "node/gen/{{folder.snakeCase()}}/providers/{{name.snakeCase()}}_provider.js",
      "data": "",
      "type": "text"
    }
  ],
  "name": "node_provider",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
    "folder": {"type": "string"}
  }
});

import 'package:mason/mason.dart';

final dartModelBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path": "lib/gen/{{name.snakeCase()}}/models/{{name.snakeCase()}}.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmpzb25fYW5ub3RhdGlvbi9qc29uX2Fubm90YXRpb24uZGFydCc7Ci8qaW1wb3J0Ki8KcGFydCAne3tuYW1lLnNuYWtlQ2FzZSgpfX0uZy5kYXJ0JzsKCkBKc29uU2VyaWFsaXphYmxlKGluY2x1ZGVJZk51bGw6IHRydWUsIGV4cGxpY2l0VG9Kc29uOiB0cnVlKQpjbGFzcyB7e25hbWUucGFzY2FsQ2FzZSgpfX0gewogIHt7bmFtZS5wYXNjYWxDYXNlKCl9fSh7CiAgLypmb3JtUGFyYW1ldGVyKi8KICB9KTsKCiAgIC8qZm9ybSovCgogIGZhY3RvcnkgIHt7bmFtZS5wYXNjYWxDYXNlKCl9fS5mcm9tSnNvbihNYXA8U3RyaW5nLCBkeW5hbWljPiBqc29uKSA9PgogICAgICBfJHt7bmFtZS5wYXNjYWxDYXNlKCl9fUZyb21Kc29uKGpzb24pOyAgCiAgTWFwPFN0cmluZywgZHluYW1pYz4gdG9Kc29uKCkgPT4gXyR7e25hbWUucGFzY2FsQ2FzZSgpfX1Ub0pzb24odGhpcyk7Cn0K",
      "type": "text"
    }
  ],
  "name": "dart_model",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
  }
});

final dartPaginationModelBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path": "lib/gen/{{folder}}/models/{{name}}.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmpzb25fYW5ub3RhdGlvbi9qc29uX2Fubm90YXRpb24uZGFydCc7CmltcG9ydCAnLi97e2ZvbGRlcn19LmRhcnQnOwoKcGFydCAne3tuYW1lfX0uZy5kYXJ0JzsKCkBKc29uU2VyaWFsaXphYmxlKGluY2x1ZGVJZk51bGw6IHRydWUsIGV4cGxpY2l0VG9Kc29uOiB0cnVlKQpjbGFzcyB7e25hbWUucGFzY2FsQ2FzZSgpfX0gewogIHt7bmFtZS5wYXNjYWxDYXNlKCl9fSh7CiAgcmVxdWlyZWQgdGhpcy5kYXRhLApyZXF1aXJlZCB0aGlzLnRvdGFsLApyZXF1aXJlZCB0aGlzLmN1cnJlbnRQYWdlLApyZXF1aXJlZCB0aGlzLnRvdGFsUGFnZQogIH0pOwoKICAgTGlzdDx7e2ZvbGRlci5wYXNjYWxDYXNlKCl9fT4gZGF0YTsKICBpbnQgdG90YWw7CiAgaW50IGN1cnJlbnRQYWdlOwogIGludCB0b3RhbFBhZ2U7CgogIGZhY3RvcnkgIHt7bmFtZS5wYXNjYWxDYXNlKCl9fS5mcm9tSnNvbihNYXA8U3RyaW5nLCBkeW5hbWljPiBqc29uKSA9PgogICAgICBfJHt7bmFtZS5wYXNjYWxDYXNlKCl9fUZyb21Kc29uKGpzb24pOyAgCiAgTWFwPFN0cmluZywgZHluYW1pYz4gdG9Kc29uKCkgPT4gXyR7e25hbWUucGFzY2FsQ2FzZSgpfX1Ub0pzb24odGhpcyk7Cn0K",
      "type": "text"
    }
  ],
  "name": "dart_pagination_model",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
    "folder": {
      "type": "string",
    },
  }
});

final dartQueryModelBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path":
          "lib/gen/{{name.snakeCase()}}/models/{{name.snakeCase()}}_query.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmpzb25fYW5ub3RhdGlvbi9qc29uX2Fubm90YXRpb24uZGFydCc7CnBhcnQgJ3t7bmFtZS5zbmFrZUNhc2UoKX19X3F1ZXJ5LmcuZGFydCc7CgpASnNvblNlcmlhbGl6YWJsZShpbmNsdWRlSWZOdWxsOiB0cnVlLCBleHBsaWNpdFRvSnNvbjogdHJ1ZSkKY2xhc3Mge3tuYW1lLnBhc2NhbENhc2UoKX19UXVlcnkgewogIHt7bmFtZS5wYXNjYWxDYXNlKCl9fVF1ZXJ5KHsKICAvKmZvcm1QYXJhbWV0ZXIqLwogIH0pOwoKICAgLypmb3JtKi8KCiAgZmFjdG9yeSAge3tuYW1lLnBhc2NhbENhc2UoKX19UXVlcnkuZnJvbUpzb24oTWFwPFN0cmluZywgZHluYW1pYz4ganNvbikgPT4KICAgICAgXyR7e25hbWUucGFzY2FsQ2FzZSgpfX1RdWVyeUZyb21Kc29uKGpzb24pOyAgCiAgTWFwPFN0cmluZywgZHluYW1pYz4gdG9Kc29uKCkgPT4gXyR7e25hbWUucGFzY2FsQ2FzZSgpfX1RdWVyeVRvSnNvbih0aGlzKTsKfQo=",
      "type": "text"
    }
  ],
  "name": "dart_query_model",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
  }
});

final dartFormBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path":
          "lib/gen/{{name.snakeCase()}}/Forms/{{name.snakeCase()}}_{{form.shakeCase()}}_form.dart",
      "data":
          "aW1wb3J0ICdkYXJ0OmlvJzsKaW1wb3J0ICdwYWNrYWdlOmRpby9kaW8uZGFydCc7CgpjbGFzcyB7e25hbWUucGFzY2FsQ2FzZSgpfX17e2Zvcm0ucGFzY2FsQ2FzZSgpfX0gewogLypmb3JtKi8KICB7e25hbWUucGFzY2FsQ2FzZSgpfX17e2Zvcm0ucGFzY2FsQ2FzZSgpfX0oewogLypmb3JtUGFyYW1ldGVyKi99KTsKICB0b0Zvcm1EYXRhKCkgYXN5bmMgPT4gRm9ybURhdGEuZnJvbU1hcCh7CiAvKmZvcm1EYXRhUGFyYW1ldGVyKi8gICAgIAogICAgICB9KTsKfQoKCgoKaW1wb3J0IG1vbmdvb3NlIGZyb20gIm1vbmdvb3NlIjsKLyppbXBvcnQqLwoKY29uc3Qgc2NoZW1hID0gbW9uZ29vc2UuU2NoZW1hKHsKICBfaWQ6IG1vbmdvb3NlLlNjaGVtYS5UeXBlcy5PYmplY3RJZCwKICAvKmZvcm0qLwp9LAp7CiAgICB0aW1lc3RhbXBzOiBmYWxzZSwKICAgIHZlcnNpb25LZXk6IGZhbHNlLAogICAgdG9KU09OOiB7CiAgICAgIHRyYW5zZm9ybShkb2MsIHJldCkgewogICAgICAgIHJldC5pZCA9IHJldC5faWQ7CiAgICAgICAgLy8gZGVsZXRlIHJldC5faWQ7CgogICAgICB9LAogICAgfSwKICAgIHRvT2JqZWN0OiB7CiAgICAgIHRyYW5zZm9ybShkb2MsIHJldCkgewogICAgICAgIHJldC5pZCA9IHJldC5faWQ7CiAgICAgIC8vICBkZWxldGUgcmV0Ll9pZDsKICAgICAgfSwKICAgIH0sCiAgfSk7CgoKLypwbHVnaW4qLwpleHBvcnQgZGVmYXVsdCBtb25nb29zZS5tb2RlbCgie3tuYW1lLnBhc2NhbENhc2UoKX19Iiwgc2NoZW1hKTs=",
      "type": "text"
    }
  ],
  "name": "dart_form_model",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
    "form": {"type" "string"}
  }
});

final dartValidatorBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path":
          "lib/gen/{{name.snakeCase()}}/validators/{{name.snakeCase()}}_validator.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmRnaHViX2dlbmVyYXRvci9kZ2h1Yl9nZW5lcmF0b3IuZGFydCc7CmltcG9ydCAnLi4vbW9kZWxzL3t7bmFtZS5zbmFrZUNhc2UoKX19LmRhcnQnOwoKY2xhc3Mge3tuYW1lLnBhc2NhbENhc2UoKX19VmFsaWRhdG9yIHsKICBWYWxpZGF0ZVJlc3VsdCBjaGVja01vZGVsKHt7bmFtZS5wYXNjYWxDYXNlKCl9fSBkYXRhKSA9PiBER1ZhbGlkYXRvci52YWxpZGF0b3IoCiAgICAgICAgewogICAgICAgICAgLypmb3JtKi8KICAgICAgICB9LAogICAgICAgIGRhdGEudG9Kc29uKCksCiAgICAgICk7Cn0=",
      "type": "text"
    }
  ],
  "name": "dart_validator",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
  }
});

final dartApiBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path": "lib/gen/{{name.snakeCase()}}/apis/{{name.snakeCase()}}_api.dart",
      "data":
          "aW1wb3J0ICcuLi8uLi8uLi9zeXN0ZW0vc2VydmljZXMvYXBpX3NlcnZpY2VzLmRhcnQnOwovKmltcG9ydCovCgpjbGFzcyB7e25hbWUucGFzY2FsQ2FzZSgpfX1BcGkgewogLypib2R5Ki8KfQ==",
      "type": "text"
    }
  ],
  "name": "dart_api",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
  }
});

final dartProviderBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path":
          "lib/gen/{{name.snakeCase()}}/providers/{{action.snakeCase()}}_provider.dart",
      "data": "",
      "type": "text"
    }
  ],
  "name": "dart_provider",
  "version": "0.1.0+1",
  "description": "A new brick created with the Mason CLI.",
  "vars": {
    "name": {
      "type": "string",
    },
    "action": {
      "type": "string",
    }
  }
});

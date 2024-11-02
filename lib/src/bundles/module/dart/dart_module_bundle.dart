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
          "lib/gen/{{name.snakeCase()}}/forms/{{name.snakeCase()}}_{{form.snakeCase()}}_form.dart",
      "data":
          "aW1wb3J0ICdwYWNrYWdlOmRpby9kaW8uZGFydCc7Ci8qaW1wb3J0Ki8KCmNsYXNzIHt7bmFtZS5wYXNjYWxDYXNlKCl9fXt7Zm9ybS5wYXNjYWxDYXNlKCl9fUZvcm17CiAge3tuYW1lLnBhc2NhbENhc2UoKX19e3tmb3JtLnBhc2NhbENhc2UoKX19Rm9ybSh7CiAgLypmb3JtUGFyYW1ldGVyKi8KICB9KTsKCiAgIC8qZm9ybSovCgogIEZ1dHVyZTxGb3JtRGF0YT4gdG9Gb3JtRGF0YSgpIGFzeW5jID0+IEZvcm1EYXRhLmZyb21NYXAoewogICAgLypmb3JtRGF0YSovCiAgfSk7Cn0K",
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
    "form": {"type": "string"}
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

final dartSocketBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path":
          "lib/gen/{{name.snakeCase()}}/sockets/{{name.snakeCase()}}_socket.dart",
      "data":
          "aW1wb3J0ICcuLi8uLi8uLi9jb25maWcvZ2xvYmFsLmRhcnQnOwppbXBvcnQgJy4uLy4uLy4uL3N5c3RlbS9zZXJ2aWNlcy9zb2NrZXRfY2xpZW50X3NlcnZpY2VzLmRhcnQnOwppbXBvcnQgJy4uL21vZGVscy97e25hbWUuc25ha2VDYXNlKCl9fWRhcnQnOwoKY2xhc3Mge3tuYW1lLnBhc2NhbENhc2UoKX19U29ja2V0IHsKICBmaW5hbCBfc29ja2V0ID0gU29ja2V0Q2xpZW50U2VydmljZXMuc29ja2V0KCd7e25hbWUuc25ha2VDYXNlKCl9fScpOwoKLypib2R5Ki8KfQo=",
      "type": "text"
    }
  ],
  "name": "dart_socket",
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

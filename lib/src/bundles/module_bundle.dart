// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal, implicit_dynamic_map_literal, inference_failure_on_collection_literal

import 'package:mason/mason.dart';

final modelBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path":
          "lib/app/{{name.snakeCase()}}/models/{{name.snakeCase()}}_model.dart",
      "data": "",
      "type": "text"
    }
  ],
  "hooks": [],
  "name": "module",
  "description": "A new brick created with the Mason CLI.",
  "version": "0.1.0+1",
  "environment": {"mason": ">=0.1.0-dev.53 <0.1.0"},
  "readme": {
    "path": "README.md",
    "data":
        "IyBtb2R1bGUKClshW1Bvd2VyZWQgYnkgTWFzb25dKGh0dHBzOi8vaW1nLnNoaWVsZHMuaW8vZW5kcG9pbnQ/dXJsPWh0dHBzJTNBJTJGJTJGdGlueXVybC5jb20lMkZtYXNvbi1iYWRnZSldKGh0dHBzOi8vZ2l0aHViLmNvbS9mZWxhbmdlbC9tYXNvbikKCkEgbmV3IGJyaWNrIGNyZWF0ZWQgd2l0aCB0aGUgTWFzb24gQ0xJLgoKX0dlbmVyYXRlZCBieSBbbWFzb25dWzFdIPCfp7FfCgojIyBHZXR0aW5nIFN0YXJ0ZWQg8J+agAoKVGhpcyBpcyBhIHN0YXJ0aW5nIHBvaW50IGZvciBhIG5ldyBicmljay4KQSBmZXcgcmVzb3VyY2VzIHRvIGdldCB5b3Ugc3RhcnRlZCBpZiB0aGlzIGlzIHlvdXIgZmlyc3QgYnJpY2sgdGVtcGxhdGU6CgotIFtPZmZpY2lhbCBNYXNvbiBEb2N1bWVudGF0aW9uXVsyXQotIFtDb2RlIGdlbmVyYXRpb24gd2l0aCBNYXNvbiBCbG9nXVszXQotIFtWZXJ5IEdvb2QgTGl2ZXN0cmVhbTogRmVsaXggQW5nZWxvdiBEZW1vcyBNYXNvbl1bNF0KLSBbRmx1dHRlciBQYWNrYWdlIG9mIHRoZSBXZWVrOiBNYXNvbl1bNV0KLSBbT2JzZXJ2YWJsZSBGbHV0dGVyOiBCdWlsZGluZyBhIE1hc29uIGJyaWNrXVs2XQotIFtNZWV0IE1hc29uOiBGbHV0dGVyIFZpa2luZ3MgMjAyMl1bN10KClsxXTogaHR0cHM6Ly9naXRodWIuY29tL2ZlbGFuZ2VsL21hc29uClsyXTogaHR0cHM6Ly9kb2NzLmJyaWNraHViLmRldgpbM106IGh0dHBzOi8vdmVyeWdvb2QudmVudHVyZXMvYmxvZy9jb2RlLWdlbmVyYXRpb24td2l0aC1tYXNvbgpbNF06IGh0dHBzOi8veW91dHUuYmUvRzRQVGpBNnRwVFUKWzVdOiBodHRwczovL3lvdXR1LmJlL3FqQTBKRmlQTW5RCls2XTogaHR0cHM6Ly95b3V0dS5iZS9vOEIxRWZjVWlzdwpbN106IGh0dHBzOi8veW91dHUuYmUvTFhoZ2lGNUhpUWcK",
    "type": "text"
  },
  "changelog": {
    "path": "CHANGELOG.md",
    "data": "IyAwLjEuMCsxCgotIFRPRE86IERlc2NyaWJlIGluaXRpYWwgcmVsZWFzZS4K",
    "type": "text"
  },
  "license": {
    "path": "LICENSE",
    "data": "VE9ETzogQWRkIHlvdXIgbGljZW5zZSBoZXJlLgo=",
    "type": "text"
  },
  "vars": {
    "name": {
      "type": "string",
      "description": "Your name",
      "default": "Dash",
      "prompt": "What is your name?"
    }
  }
});

final controllerBundle = MasonBundle.fromJson(<String, dynamic>{
  "files": [
    {
      "path":
          "lib/app/{{name.snakeCase()}}/controllers/{{name.snakeCase()}}_controller.dart",
      "data": "",
      "type": "text"
    },
  ],
  "hooks": [],
  "name": "module",
  "description": "A new brick created with the Mason CLI.",
  "version": "0.1.0+1",
  "environment": {"mason": ">=0.1.0-dev.53 <0.1.0"},
  "readme": {
    "path": "README.md",
    "data":
        "IyBtb2R1bGUKClshW1Bvd2VyZWQgYnkgTWFzb25dKGh0dHBzOi8vaW1nLnNoaWVsZHMuaW8vZW5kcG9pbnQ/dXJsPWh0dHBzJTNBJTJGJTJGdGlueXVybC5jb20lMkZtYXNvbi1iYWRnZSldKGh0dHBzOi8vZ2l0aHViLmNvbS9mZWxhbmdlbC9tYXNvbikKCkEgbmV3IGJyaWNrIGNyZWF0ZWQgd2l0aCB0aGUgTWFzb24gQ0xJLgoKX0dlbmVyYXRlZCBieSBbbWFzb25dWzFdIPCfp7FfCgojIyBHZXR0aW5nIFN0YXJ0ZWQg8J+agAoKVGhpcyBpcyBhIHN0YXJ0aW5nIHBvaW50IGZvciBhIG5ldyBicmljay4KQSBmZXcgcmVzb3VyY2VzIHRvIGdldCB5b3Ugc3RhcnRlZCBpZiB0aGlzIGlzIHlvdXIgZmlyc3QgYnJpY2sgdGVtcGxhdGU6CgotIFtPZmZpY2lhbCBNYXNvbiBEb2N1bWVudGF0aW9uXVsyXQotIFtDb2RlIGdlbmVyYXRpb24gd2l0aCBNYXNvbiBCbG9nXVszXQotIFtWZXJ5IEdvb2QgTGl2ZXN0cmVhbTogRmVsaXggQW5nZWxvdiBEZW1vcyBNYXNvbl1bNF0KLSBbRmx1dHRlciBQYWNrYWdlIG9mIHRoZSBXZWVrOiBNYXNvbl1bNV0KLSBbT2JzZXJ2YWJsZSBGbHV0dGVyOiBCdWlsZGluZyBhIE1hc29uIGJyaWNrXVs2XQotIFtNZWV0IE1hc29uOiBGbHV0dGVyIFZpa2luZ3MgMjAyMl1bN10KClsxXTogaHR0cHM6Ly9naXRodWIuY29tL2ZlbGFuZ2VsL21hc29uClsyXTogaHR0cHM6Ly9kb2NzLmJyaWNraHViLmRldgpbM106IGh0dHBzOi8vdmVyeWdvb2QudmVudHVyZXMvYmxvZy9jb2RlLWdlbmVyYXRpb24td2l0aC1tYXNvbgpbNF06IGh0dHBzOi8veW91dHUuYmUvRzRQVGpBNnRwVFUKWzVdOiBodHRwczovL3lvdXR1LmJlL3FqQTBKRmlQTW5RCls2XTogaHR0cHM6Ly95b3V0dS5iZS9vOEIxRWZjVWlzdwpbN106IGh0dHBzOi8veW91dHUuYmUvTFhoZ2lGNUhpUWcK",
    "type": "text"
  },
  "changelog": {
    "path": "CHANGELOG.md",
    "data": "IyAwLjEuMCsxCgotIFRPRE86IERlc2NyaWJlIGluaXRpYWwgcmVsZWFzZS4K",
    "type": "text"
  },
  "license": {
    "path": "LICENSE",
    "data": "VE9ETzogQWRkIHlvdXIgbGljZW5zZSBoZXJlLgo=",
    "type": "text"
  },
  "vars": {
    "name": {
      "type": "string",
      "description": "Your name",
      "default": "Dash",
      "prompt": "What is your name?"
    }
  }
});

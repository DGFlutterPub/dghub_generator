// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DGConfig {
  final bool node;
  final bool python;
  final bool createdAt;
  final bool updatedAt;
  final bool deletedAt;
  final bool id;
  final bool autoIncrement;

  const DGConfig({
    this.node = true,
    this.python = true,
    this.createdAt = true,
    this.deletedAt = true,
    this.updatedAt = true,
    this.id = true,
    this.autoIncrement = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'node': node,
      'python': python,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'id': id,
      'autoIncrement': autoIncrement,
    };
  }

  factory DGConfig.fromMap(Map<String, dynamic> map) {
    return DGConfig(
      node: map['node'] as bool,
      python: map['python'] as bool,
      createdAt: map['createdAt'] as bool,
      updatedAt: map['updatedAt'] as bool,
      deletedAt: map['deletedAt'] as bool,
      id: map['id'] as bool,
      autoIncrement: map['autoIncrement'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DGConfig.fromJson(String source) =>
      DGConfig.fromMap(json.decode(source) as Map<String, dynamic>);
}

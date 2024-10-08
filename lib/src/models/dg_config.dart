class DGConfig {
  final bool dart;
  final bool node;
  final bool python;
  final bool createdAt;
  final bool updatedAt;
  final bool deletedAt;
  final bool id;
  final bool autoIncrement;

  const DGConfig({
    this.dart = true,
    this.node = true,
    this.python = true,
    this.createdAt = true,
    this.deletedAt = true,
    this.updatedAt = true,
    this.id = true,
    this.autoIncrement = false,
  });
}

class DGConfig {
  final bool node;
  final bool createdAt;
  final bool updatedAt;
  final bool deletedAt;

  const DGConfig({
    this.node = true,
    this.createdAt = true,
    this.deletedAt = true,
    this.updatedAt = true,
  });
}

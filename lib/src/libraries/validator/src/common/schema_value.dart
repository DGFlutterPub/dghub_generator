/// SchemaValue - Abstract Class for Schema Elements
///
/// This abstract class serves as the base for schema elements in the `DGSchema` system.
/// It is designed to enforce type safety within the `DGSchema` class, ensuring that the schema
/// can only contain elements that are either instances of `DGValidator` or `DGSchema`.
abstract class SchemaValue {}

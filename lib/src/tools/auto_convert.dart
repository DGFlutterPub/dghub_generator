import 'package:analyzer/dart/constant/value.dart';

Map<String, dynamic> parseData({
  required List<String> variables,
  required DartObject object,
}) {
  var map = <String, dynamic>{};

  for (var e in variables) {
    var v = object.getField(e);

    if (v == null || v.isNull) continue;

    map[e] = getDataFromDartObject(v);
  }

  return map;
}

List<String> getVariablesFromDartObject(DartObject v) {
  var children = v.type!.element!.children;
  children.removeLast();
  return children.map((e) => e.name!).toList();
}

dynamic getDataFromDartObject(DartObject v) {
  if (v.isNull) return null;

  var type = v.type!;

  if (type.isDartCoreDouble) return v.toDoubleValue();
  if (type.isDartCoreInt) return v.toIntValue();
  if (type.isDartCoreString) return v.toStringValue();
  if (type.isDartCoreBool) return v.toBoolValue();

  if (type.isDartCoreList) {
    return v.toListValue()!.map((e) {
      var variables = getVariablesFromDartObject(e);
      return parseData(variables: variables, object: e);
    }).toList();
  }

  if (type.isDartCoreMap) return v.toMapValue();

  if (v.toString().contains('_name')) {
    return v.getField('_name')?.toStringValue();
  }
  if (type.isDartCoreType) return v.toTypeValue();

  var variables = getVariablesFromDartObject(v);
  return parseData(variables: variables, object: v);
}

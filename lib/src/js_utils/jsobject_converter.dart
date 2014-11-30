part of tekartik_js_utils;

List<String> jsObjectKeys(JsObject jsObject) {
  if (jsObject is JsArray) {
    throw new ArgumentError('object is an array');
  }
  JsArray jsKeys = context['Object'].callMethod('keys', [jsObject]);
  List<String> keys = new List();
  for (int i = 0; i < jsKeys.length; i++) {
    keys.add(jsKeys[i]);
  }
  return keys;
}

/**
 * For JsObject of JsArray
 */
dynamic jsObjectAsCollection(JsObject jsObject) {
  if (jsObject is JsArray) {
    return jsArrayAsList(jsObject);
  }
  return jsObjectAsMap(jsObject);
}

List jsArrayAsList(JsArray jsArray) {
  List list = new List();
  for (int i = 0; i < jsArray.length; i++) {
    var value = jsArray[i];
    if (value is JsObject) {
      value = jsObjectAsCollection(value);
    }
    list.add(value);
  }
  return list;
}

Map jsObjectAsMap(JsObject jsObject) {
  List<String> keys = jsObjectKeys(jsObject);
  Map map = {};
  for (String key in keys) {
    var value = jsObject[key];
    if (value is JsObject) {
      // recursive
      value = jsObjectAsCollection(value);
    }
    map[key] = value;
  }
  return map;
}

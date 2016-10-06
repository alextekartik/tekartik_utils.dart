// use json_utils from tekartik_common_utils
@deprecated
library tekartik_json_utils;

import 'dart:convert';

// use parseJsonObject from common_utils
@deprecated
Map parseJsonObject(String text, [String defaultText = null]) {
  try {
    var map = JSON.decode(text);
    if (!(map is Map)) {
      return null;
    }
    return map;
  } catch (e) {
    // print("var ${e}");
    if (defaultText == null) {
      return null;
    }
    return JSON.decode(defaultText);
  }
}

// use parseJsonList from common_utils
@deprecated
List parseJsonList(String text, [String defaultText = null]) {
  try {
    var list = JSON.decode(text);
    if (!(list is List)) {
      return null;
    }
    return list;
  } catch (e) {
    // print("var ${e}");
    if (defaultText == null) {
      return null;
    }
    return JSON.decode(defaultText);
  }
}

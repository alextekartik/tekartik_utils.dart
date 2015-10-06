library tekartik_utils.list_utils;

import 'map_utils.dart';

/**
 * Clone list and list of list
 */
List cloneList(List original) {
  if (original == null) {
    return null;
  }
  List clone = new List();
  original.forEach((item) {
    if (item is List) {
      item = cloneList(item);
    } else if (item is Map) {
      item = cloneMap(item);
    }
    clone.add(item);
  });
  return clone;
}

/**
 * better to have original1 bigger than original2
 * optimization could handle that
 */
List intersectList(List original1, List original2) {
  List list = new List();

  original1.forEach((element) {
    if (original2.contains(element)) {
      list.add(element);
    }
  });

  return list;
}

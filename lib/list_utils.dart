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
    dynamic cloneItem;
    if (item is List) {
      cloneItem = cloneList(item);
    } else if (item is Map) {
      cloneItem = cloneMap(item);
    } else {
      cloneItem = item;
    }
    clone.add(cloneItem);
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

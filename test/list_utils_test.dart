library list_utils_tests;

import 'package:test/test.dart';
import 'package:tekartik_utils/list_utils.dart';

main() {
  group('list_utils', () {
    test('equals', () {
      expect(cloneList([]), []);
      expect(identical(cloneList([]), []), isFalse);

      List list1 = [1, [], {}];
      List listFrom = new List.from(list1);
      List list2 = cloneList(list1);
      expect(listFrom, list1);
      expect(list2, list1);

      // however their map/list content is not identical (i.e. cloned)
      expect(identical(listFrom[0], list1[0]), isTrue);
      expect(identical(list2[0], list1[0]), isTrue);
      expect(identical(listFrom[1], list1[1]), isTrue);
      expect(identical(list2[1], list1[1]), isFalse);
      expect(identical(listFrom[2], list1[2]), isTrue);
      expect(identical(list2[2], list1[2]), isFalse);
    });
  });
}

library map_utils_tests;

import 'package:test/test.dart';
import 'package:tekartik_utils/map_utils.dart';
import 'dart:convert';

main() {
  group('map utils', () {
    test('mergeMap', () {
      Map dst = {};
      mergeMap(dst, {'test': 1});
      expect(dst['test'], 1);
    });

    test('mapValueFromPath', () {
      String json = '''
      {
              "home" : "home",
              "about" : "about",
              "contact" : "contact",
              "products" :
              {
                  "home" : "home",
                  "list" : "list",
                  "product" :
                  {
                      "home" : "home",
                      "specs" : "specs",
                      "warranty" : "warranty",
                      "related" : "related"
                  }
              } }
''';
      Map map = JSON.decode(json);
      expect(mapValueFromPath(map, 'products/product/warranty'), "warranty");
      expect(mapValueFromPath(map, 'products/product/warrant'), null);
    });
  });
}

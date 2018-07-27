library map_utils_tests;

import 'dart:convert';

import 'package:tekartik_utils/map_utils.dart';
import 'package:test/test.dart';

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
      Map map = JSON.decode(json) as Map;
      expect(mapValueFromPath(map, 'products/product/warranty'), "warranty");
      expect(mapValueFromPath(map, 'products/product/warrant'), null);
    });
  });
}

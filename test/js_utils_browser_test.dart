library js_utils_browser_test;

import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/test_utils_browser.dart';

main() {
  test('jsObject', () {
    JsObject jsObject = new JsObject.jsify({
      "test": "value"
    });
    expect(jsRuntimeType(jsObject), "Object");
    expect(jsObject.runtimeType, JsObject);

    JsArray jsArray = new JsArray();
    expect(jsArray.runtimeType, JsArray);
    expect(jsRuntimeType(jsArray), "Array");

    expect(jsObjectLength(jsObject), null);
    expect(jsObjectLength(jsArray), 0);

    jsObject = new JsObject.jsify([]);
    expect(jsObject.runtimeType, JsArray);
    expect(jsRuntimeType(jsObject), "Array");
  });
}

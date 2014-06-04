library js_utils;

import 'dart:js';
import 'dart:async';
import 'dart:html';
import 'dart:typed_data';

Future debugLoadJavascriptScript(String src) {
  Completer completer = new Completer();
  var script = new ScriptElement();
  script.type = 'text/javascript';
  script.onError.listen((e) {
    // This is actually the only callback called upon success
    // onError, onDone are never called
    completer.completeError(new Exception('script $src not loaded'));
  }, onError: (e, st) {
    // never called
    print('onErrorError');
    completer.completeError(e, st);
  }, onDone: () {
    // never called
    print('onErrorDone');
  });
  script.onLoad.listen((_) {
    // This is actually the only callback called upon success
    // onError, onDone are never called
    completer.complete();
  }, onError: (e, st) {
    // never called
    print('onError');
    completer.completeError(e, st);
  }, onDone: () {
    // never called
    print('onDone');
  });
  script.src = src;
  document.body.children.add(script);
  return completer.future;
}

Future loadJavascriptScript(String src) {
  Completer completer = new Completer();
  var script = new ScriptElement();
  script.type = 'text/javascript';
  script.onError.listen((e) {
    // This is actually the only callback called upon success
    // onError, onDone are never called
    completer.completeError(new Exception('script $src not loaded'));
  });
  script.onLoad.listen((_) {
    // This is actually the only callback called upon success
    // onError, onDone are never called
    completer.complete();
  });
  script.src = src;
  document.body.children.add(script);
  return completer.future;
}

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

String jsRuntimeType(JsObject jsObject) {
  return jsObject['constructor']['name'].toString();
}

JsObject jsUint8Array(Uint8List list) {
  return new JsObject(context['Uint8Array'], [list]);
}

bool jsObjectHasLength(JsObject jsObject) {
  return jsObject.hasProperty('length');
}

int jsObjectLength(JsObject jsObject) {
  return jsObject['length'];
}

dynamic jsArrayItem(JsObject jsObject, int index) {
  return jsObject[index];
}

String jsObjectOrAnyToDebugString(dynamic object) {
  if (object is JsObject) {
    return jsObjectToDebugString(object);
  } else if (object == null) {
    return null;
  } else {
    return object.toString();
  }
}

String jsObjectToDebugString(JsObject jsObject) {
  if (jsObject == null) {
    return null;
  }
  StringBuffer sb = new StringBuffer();
  //sb.write(jsObject.runtimeType);
  //sb.write('-');
  if (jsObjectHasLength(jsObject)) {
    int length_ = jsObjectLength(jsObject);

    if (length_ != null) {

      if (length_ == 1) {
        sb.write(jsObjectOrAnyToDebugString(jsArrayItem(jsObject, 0)));
      } else {
        sb.write('$length_ items:[');
        for (int i = 0; i < length_; i++) {
          //sb.writeln();
          sb.write('$i:');
          sb.write(jsObjectOrAnyToDebugString(jsArrayItem(jsObject, i)));
        }
        sb.write(']');
      }
      return sb.toString();
    }

  }
  sb.write(jsObjectAsCollection(jsObject));
  return sb.toString();
}

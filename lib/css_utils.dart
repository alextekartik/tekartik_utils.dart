library tekartik_css_utils;

import 'dart:async';
import 'dart:html';

Future loadStylesheet(String src) {
  Completer completer = new Completer();
  var link = new LinkElement();
  link.type = 'text/css';
  link.onError.listen((e) {
    // This is actually the only callback called upon success
    // onError, onDone are never called
    completer.completeError(new Exception('stylesheet $src not loaded'));
  });
  link.onLoad.listen((_) {
    // This is actually the only callback called upon success
    // onError, onDone are never called
    completer.complete();
  });
  link.href = src;
  link.rel = "stylesheet";
  document.head.children.add(link);
  return completer.future;
}

library tekartik_polymer_utils;

import 'dart:html';

/**
 * mixin for polymer not using shadowDom
 */
abstract class NoShadowDom {
  Node shadowFromTemplate(Element template) {
    var dom = instanceTemplate(template);
    append(dom);
    shadowRootReady(this as Node, template);
    return null; // no shadow here, it's all bright and shiny
  }

  Node append(Node newChild);
  DocumentFragment instanceTemplate(Element template);
  void shadowRootReady(Node root, Element template);
}

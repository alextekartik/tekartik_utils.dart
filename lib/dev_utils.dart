/**
 * Development helpers to generate warning in code
 */
library tekartik_dev_utils;

@deprecated
void devPrint(Object object) {
  print(object);
}

devError(String msg) {
  // one day remove the print however sometimes the error thrown is hidden
  print("# ERROR $msg");
  throw new UnsupportedError(msg);
}

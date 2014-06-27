/**
 * Development helpers to generate warning in code
 */
library tekartik_dev_utils;

@deprecated
void devPrint(Object object) {
  print(object);
}

@deprecated
int devWarning;

devError([String msg = null]) {
  // one day remove the print however sometimes the error thrown is hidden
  try {
    throw new UnsupportedError(msg);
  } catch (e, st) {
    print("# ERROR $msg");
    print(st);
    throw e;
  }
}

/**
 * Development helpers to generate warning in code
 */
library tekartik_dev_utils;

@deprecated
bool devPrintEnabled = true;

@deprecated
void devPrint(Object object) {
  if (devPrintEnabled) {
   print(object);
  }
}

@deprecated
int devWarning;

@deprecated
devError([String msg = null]) {
  // one day remove the print however sometimes the error thrown is hidden
  try {
    throw new UnsupportedError(msg);
  } catch (e, st) {
    if (devPrintEnabled) {
      print("# ERROR $msg");
      print(st);
    }
    throw e;
  }
}

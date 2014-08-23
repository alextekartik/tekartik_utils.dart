/**
 * Development helpers to generate warning in code
 */
library tekartik_dev_utils;

void _devPrint(Object object) {
  if (_devPrintEnabled) {
    print(object);
  }
}

bool _devPrintEnabled = true;

@deprecated
set devPrintEnabled(bool enabled) => _devPrintEnabled = enabled;

@deprecated
void devPrint(Object object) {
  if (_devPrintEnabled) {
   print(object);
  }
}

@deprecated
int devWarning;

_devError([String msg = null]) {
  // one day remove the print however sometimes the error thrown is hidden
  try {
    throw new UnsupportedError(msg);
  } catch (e, st) {
    if (_devPrintEnabled) {
      print("# ERROR $msg");
      print(st);
    }
    throw e;
  }
}

@deprecated
devError([String msg = null]) => _devError(msg);

// exported for testing
void tekartikDevPrint(Object object) => _devPrint(object);
void tekartikDevError(Object object) => _devError(object);
set tekartikDevPrintEnabled(bool enabled) => _devPrintEnabled = enabled;

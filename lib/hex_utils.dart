library tekartik_utils.hex_utils;

import 'dart:math';

/**
 * 
 */
int _ACodeUnit = 'A'.codeUnitAt(0);
int _aCodeUnit = 'a'.codeUnitAt(0);
int _0CodeUnit = '0'.codeUnitAt(0);

int hexCharValue(int charCode) {
  if (charCode >= _ACodeUnit && charCode < _ACodeUnit + 6) {
    return charCode - _ACodeUnit + 10;
  }
  if (charCode >= _ACodeUnit && charCode < _aCodeUnit + 6) {
    return charCode - _aCodeUnit + 10;
  }
  if (charCode >= _0CodeUnit && charCode < _0CodeUnit + 10) {
    return charCode - _0CodeUnit;
  }
  return null;
}

int hexCodeUint4(int value) {
  value = value & 0xF;
  if (value < 10) {
    return _0CodeUnit + value;
  } else {
    return _ACodeUnit + value - 10;
  }
}

int hex1CodeUint8(int value) {
  return hexCodeUint4((value & 0xF0) >> 4);
}

int hex2CodeUint8(int value) {
  return hexCodeUint4(value);
}

String hexUint8(int value) {
  return new String.fromCharCodes([hex1CodeUint8(value), hex2CodeUint8(value)]);
}

String hexQuickView(List<int> data, [int maxLen]) {
  if (data == null) {
    return '(null)';
  }
  if (maxLen == null) {
    maxLen = data.length;
  } else {
    maxLen = min(data.length, maxLen);
  }
  StringBuffer out = new StringBuffer();
  for (int i = 0; i < maxLen; i++) {
    if (i > 0) {
      out.write(' ');
      if ((i % 4) == 0) {
        out.write(' ');
      }
      if ((i % 16) == 0) {
        out.write(' ');
      }
    }
    int charCode = data[i];
    out.writeCharCode(hex1CodeUint8(charCode));
    out.writeCharCode(hex2CodeUint8(charCode));
  }
  return out.toString();
}

String hexPretty(List<int> data) {
  int blockSize = 16;
  int readSize;
  int lineIndex = 0;
  int position = 0;
  StringBuffer out = new StringBuffer();
  do {
    if (lineIndex++ > 0) {
      out.writeln();
    }
    int i;
    readSize = data.length - position;
    if (readSize > blockSize) {
      readSize = blockSize;
    }

    List<int> buffer = data.sublist(position, position + readSize);
    position += readSize;

    for (i = 0; i < buffer.length; i++) {
      if (i > 0) {
        out.write(' ');
        if ((i % 4) == 0) {
          out.write(' ');
        }
        if ((i % 16) == 0) {
          out.write(' ');
        }
      }
      int charCode = buffer[i];
      out.writeCharCode(hex1CodeUint8(charCode));
      out.writeCharCode(hex2CodeUint8(charCode));
    }

    if (i > 0) {
      for (; i < blockSize; i++) {
        if (i > 0) {
          out.write(' ');
          if ((i % 4) == 0) {
            out.write(' ');
          }
          if ((i % 16) == 0) {
            out.write(' ');
          }
        }
        out.write("..");
      }
    }

    out.write("  ");

    for (i = 0; i < readSize; i++) {
      if (i > 0) {
        if ((i % 4) == 0) {
          out.write(' ');
        }
        if ((i % 16) == 0) {
          out.write(' ');
        }
      }

      int charCode = buffer[i];
      if (charCode >= 32 && charCode <= 255) {
        out.writeCharCode(charCode);
      } else {
        out.write('?');
      }
    }
    if (i > 0) {
      for (; i < blockSize; i++) {
        if (i > 0) {
          if ((i % 4) == 0) {
            out.write(' ');
          }
          if ((i % 16) == 0) {
            out.write(' ');
          }
        }
        out.write('.');
      }
    }
    // out.println(len);

  } while (readSize == blockSize);

  return out.toString();
}

List<int> parseHexString(String text) {
  List<int> data = new List();
  int firstNibble = null;

  text.codeUnits.forEach((int charCode) {
    if (firstNibble == null) {
      firstNibble = hexCharValue(charCode);
    } else {
      int secondNibble = hexCharValue(charCode);
      if (secondNibble != null) {
        data.add(firstNibble * 16 + secondNibble);
        firstNibble = null;
      }
    }
  });
  return data;
}

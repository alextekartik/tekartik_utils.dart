library uri_utils_tests;

import 'package:test/test.dart';
import 'package:tekartik_utils/uri_utils.dart';

void main() => defineTests();

void defineTests() {
  test('getArguments', () {
    Map<String, String> params;

    params = uriGetArguments("?t=1");
    expect(params.length, equals(1));
    expect(params['t'], equals("1"));
    expect(params['y'], isNull);

    params = uriGetArguments("t=1");
    expect(params.length, equals(1));
    expect(params['t'], equals("1"));
    expect(params['y'], isNull);

    params = uriGetArguments("/fulluri/yeap?t=1");
    expect(params.length, equals(1));
    expect(params['t'], equals("1"));
    expect(params['y'], isNull);


    expect(uriGetArguments('?tata&log=info&tutu=1')['tutu'], equals('1'));
    expect(uriGetArguments('?tata&log=info&tutu=1')['tata'], equals(''));
    expect(uriGetArguments('tata&log=info&tutu=1')['tata'], equals(''));
    expect(uriGetArguments('tata&log=info&tutu=1')['tata'], equals(''));
    expect(uriGetArguments(null).isEmpty, isTrue);

    // Handle decoding
    String search = 'state=%7B"ids":%5B"0B4xfXXDGtr7XbGZvaGZadlAtb1U"%5D,"action":"open","userId":"106049382465267012344"%7D';
    //Map map = Uri.splitQueryString(search); // this fails as it does not handle the ?
    Map map = uriGetArguments(search);
    //print(map['state']);
    expect(map['state'].startsWith('{"ids":["0B4x'), isTrue);
    //String uri = 'http://milomedy.tekartik.com/?state=%7B%22ids%22:%5B%220B4xfXXDGtr7XbGZvaGZadlAtb1U%22%5D,%22action%22:%22open%22,%22userId%22:%22106049382465267012344%22%7D';
    //Uri.parse(uri)
  });

  test('uriPath', () {
    expect(uriPath('.'), equals('.'));
    expect(uriPath('file:///path/file?env'), equals('/path/file'));
  });

  test('urlRoot', () {
    expect(urlRoot('http://localhost:8080/gsitesw.html#alexcavaquinho'), 'http://localhost:8080');
  });




}

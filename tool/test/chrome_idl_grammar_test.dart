library chrome_idl_test;

import 'package:petitparser/core.dart';
import 'package:petitparser/parser.dart';
import 'package:petitparser/reflection.dart';
import 'package:test/test.dart';

import '../lib/chrome_idl_parser.dart';

bool Function(String) accept(Parser parser) =>
    (input) => parser.parse(input).isSuccess;

void main() {
  final grammar = ChromeIDLGrammar();
  test('grammar linter', () {
    final parser = grammar.build();
    expect(linter(parser), isEmpty);
  });

  test('Parse identifier', () {
    var parser = grammar.buildFrom(grammar.identifier()).end();

    var result = parser.parse('abc23 ');
    expect(result.value, 'abc23');
  });

  test('Parse integer', () {
    var parser = grammar.buildFrom(grammar.integer()).end();

    var result = parser.parse('123');
    expect(result.value, 123);
  });

  test('Parse attribute identifier', () {
    var attribute = grammar.buildFrom(grammar.attributeLexical()).end();
    expect('a=b', accept(attribute));
    expect('ab=bc', accept(attribute));
    expect('ab1=c12', accept(attribute));
    expect('ab1=', isNot(accept(attribute)));
  });

  test('Parse attribute string literal', () {
    var attribute = grammar.buildFrom(grammar.attributeLexical()).end();
    expect('a="b"', accept(attribute));
    expect('a=""', accept(attribute));
    expect('a= ""', accept(attribute));
    expect('a = ""', accept(attribute));
    expect('ab="bc"', accept(attribute));
    expect('ab1="123"', accept(attribute));
    expect('ab1="&123@"', accept(attribute));
    expect('''ab1="'&123@"''', accept(attribute));
    expect('a="', isNot(accept(attribute)));
    expect('a="bc', isNot(accept(attribute)));
  });

  test('Parse attribute integer', () {
    var attribute = grammar.buildFrom(grammar.attributeLexical()).end();
    expect('a=1', accept(attribute));
    expect('a=123', accept(attribute));
  });

  test('Parse attribute integer list', () {
    var attribute = grammar.buildFrom(grammar.attributeLexical()).end();
    expect('a=(1)', accept(attribute));
    expect('a=(123)', accept(attribute));
    expect('a=()', isNot(accept(attribute)));
    expect('a=(13,245)', accept(attribute));
    expect('a=(13,24,)', isNot(accept(attribute)));
  });

  test('Parse attribute alone', () {
    var attribute = grammar.buildFrom(grammar.attributeLexical()).end();
    expect('a', accept(attribute));
    expect('abc', accept(attribute));
    expect('_a', accept(attribute));
    expect('___a', accept(attribute));
    expect(r'$a', accept(attribute));
    expect('1abc', isNot(accept(attribute)));
  });
}

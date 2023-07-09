import 'chrome.dart';
export 'chrome.dart';

final _scripting = ChromeScripting._();

extension ChromeChromeScriptingExtension on Chrome {
  ChromeScripting get scripting => _scripting;
}

class ChromeScripting {
  ChromeScripting._();
}

///  The origin for a style change.
///  See <a
/// href="https://developer.mozilla.org/en-US/docs/Glossary/Style_origin">style
/// origins</a>
///  for more info.
enum StyleOrigin {
  author('AUTHOR'),
  user('USER');

  const StyleOrigin(this.value);

  final String value;
}

///  The JavaScript world for a script to execute within.
enum ExecutionWorld {
  ///  The isolated world, unique to this extension.
  isolated('ISOLATED'),

  ///  The main world of the DOM, shared with the page's JavaScript.
  main('MAIN');

  const ExecutionWorld(this.value);

  final String value;
}

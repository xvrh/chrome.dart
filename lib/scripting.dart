import 'chrome.dart';
export 'chrome.dart';

final _scripting = ChromeScripting._();

extension ChromeChromeScriptingExtension on Chrome {
  ChromeScripting get scripting => _scripting;
}

class ChromeScripting {
  ChromeScripting._();

  ///  An object available for content scripts running in isolated worlds to use
  ///  and modify as a JS object. One instance exists per frame and is shared
  ///  between all content scripts for a given extension. This object is
  ///  initialized when the frame is created, before document_start.
  ///  TODO(crbug.com/1054624): Enable this once implementation is complete.
  void globalParams() => throw UnimplementedError();
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

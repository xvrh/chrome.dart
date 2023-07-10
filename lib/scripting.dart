import 'chrome.dart';
export 'chrome.dart';

final _scripting = ChromeScripting._();

extension ChromeChromeScriptingExtension on Chrome {
  ChromeScripting get scripting => _scripting;
}

class ChromeScripting {
  ChromeScripting._();

  ///  Injects a script into a target context. The script will be run at
  ///  `document_idle`. If the script evaluates to a promise,
  ///  the browser will wait for the promise to settle and return the
  ///  resulting value.
  ///  |injection|: The details of the script which to inject.
  ///  |callback|: Invoked upon completion of the injection. The resulting
  ///  array contains the result of execution for each frame where the
  ///  injection succeeded.
  void executeScript(injection) => throw UnimplementedError();

  ///  Inserts a CSS stylesheet into a target context.
  ///  If multiple frames are specified, unsuccessful injections are ignored.
  ///  |injection|: The details of the styles to insert.
  ///  |callback|: Invoked upon completion of the insertion.
  void insertCSS(injection) => throw UnimplementedError();

  ///  Removes a CSS stylesheet that was previously inserted by this extension
  ///  from a target context.
  ///  |injection|: The details of the styles to remove. Note that the
  ///  `css`, `files`, and `origin` properties
  ///  must exactly match the stylesheet inserted through $(ref:insertCSS).
  ///  Attempting to remove a non-existent stylesheet is a no-op.
  ///  |callback|: A callback to be invoked upon the completion of the removal.
  void removeCSS(injection) => throw UnimplementedError();

  ///  Registers one or more content scripts for this extension.
  ///  |scripts|: Contains a list of scripts to be registered. If there are
  ///  errors during script parsing/file validation, or if the IDs specified
  ///  already exist, then no scripts are registered.
  ///  |callback|: A callback to be invoked once scripts have been fully
  ///  registered or if an error has occurred.
  void registerContentScripts(scripts) => throw UnimplementedError();

  ///  Returns all dynamically registered content scripts for this extension
  ///  that match the given filter.
  ///  |filter|: An object to filter the extension's dynamically registered
  ///  scripts.
  void getRegisteredContentScripts(filter) => throw UnimplementedError();

  ///  Unregisters content scripts for this extension.
  ///  |filter|: If specified, only unregisters dynamic content scripts which
  ///  match the filter. Otherwise, all of the extension's dynamic content
  ///  scripts are unregistered.
  ///  |callback|: A callback to be invoked once scripts have been unregistered
  ///  or if an error has occurred.
  void unregisterContentScripts(filter) => throw UnimplementedError();

  ///  Updates one or more content scripts for this extension.
  ///  |scripts|: Contains a list of scripts to be updated. A property is only
  ///  updated for the existing script if it is specified in this object. If
  ///  there are errors during script parsing/file validation, or if the IDs
  ///  specified do not correspond to a fully registered script, then no scripts
  ///  are updated.
  ///  |callback|: A callback to be invoked once scripts have been updated or
  ///  if an error has occurred.
  void updateContentScripts(scripts) => throw UnimplementedError();
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

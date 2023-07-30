import 'src/internal_helpers.dart';
import 'src/js/file_browser_handler.dart' as $js;

export 'src/chrome.dart' show chrome;

final _fileBrowserHandler = ChromeFileBrowserHandler._();

extension ChromeFileBrowserHandlerExtension on Chrome {
  /// Use the `chrome.fileBrowserHandler` API to extend the Chrome OS file
  /// browser. For example, you can use this API to enable users to upload files
  /// to your website.
  ChromeFileBrowserHandler get fileBrowserHandler => _fileBrowserHandler;
}

class ChromeFileBrowserHandler {
  ChromeFileBrowserHandler._();

  bool get isAvailable => $js.chrome.fileBrowserHandlerNullable != null;

  /// Fired when file system action is executed from ChromeOS file browser.
  Stream<OnExecuteEvent> get onExecute =>
      $js.chrome.fileBrowserHandler.onExecute.asStream(($c) => (
            String id,
            $js.FileHandlerExecuteEventDetails details,
          ) {
            $c.add(OnExecuteEvent(
              id: id,
              details: FileHandlerExecuteEventDetails.fromJS(details),
            ));
          }.toJS);
}

class FileHandlerExecuteEventDetails {
  FileHandlerExecuteEventDetails.fromJS(this._wrapped);

  FileHandlerExecuteEventDetails({
    /// Array of Entry instances representing files that are targets of this
    /// action (selected in ChromeOS file browser).
    required List<Object> entries,

    /// The ID of the tab that raised this event. Tab IDs are unique within a
    /// browser session.
    int? tab_id,
  }) : _wrapped = $js.FileHandlerExecuteEventDetails()
          ..entries = entries.toJSArray((e) => e.toJS)
          ..tab_id = tab_id;

  final $js.FileHandlerExecuteEventDetails _wrapped;

  $js.FileHandlerExecuteEventDetails get toJS => _wrapped;

  /// Array of Entry instances representing files that are targets of this
  /// action (selected in ChromeOS file browser).
  List<Object> get entries =>
      _wrapped.entries.toDart.cast<JSAny>().map((e) => e).toList();
  set entries(List<Object> v) {
    _wrapped.entries = v.toJSArray((e) => e.toJS);
  }

  /// The ID of the tab that raised this event. Tab IDs are unique within a
  /// browser session.
  int? get tab_id => _wrapped.tab_id;
  set tab_id(int? v) {
    _wrapped.tab_id = v;
  }
}

class OnExecuteEvent {
  OnExecuteEvent({
    required this.id,
    required this.details,
  });

  /// File browser action id as specified in the listener component's manifest.
  final String id;

  /// File handler execute event details.
  final FileHandlerExecuteEventDetails details;
}

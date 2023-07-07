/* This file has been generated from file_browser_handler.json - do not edit */

/**
 * Use the `chrome.fileBrowserHandler` API to extend the Chrome OS file browser.
 * For example, you can use this API to enable users to upload files to your
 * website.
 */
library chrome.fileBrowserHandler;

import '../src/common.dart';

/**
 * Accessor for the `chrome.fileBrowserHandler` namespace.
 */
final ChromeFileBrowserHandler fileBrowserHandler = ChromeFileBrowserHandler._();

class ChromeFileBrowserHandler extends ChromeApi {
  JsObject get _fileBrowserHandler => chrome['fileBrowserHandler'];

  /**
   * Fired when file system action is executed from ChromeOS file browser.
   */
  Stream<OnExecuteEvent> get onExecute => _onExecute.stream;
  late ChromeStreamController<OnExecuteEvent> _onExecute;

  ChromeFileBrowserHandler._() {
    var getApi = () => _fileBrowserHandler;
    _onExecute = ChromeStreamController<OnExecuteEvent>.twoArgs(getApi, 'onExecute', _createOnExecuteEvent);
  }

  bool get available => _fileBrowserHandler != null;
}

/**
 * Fired when file system action is executed from ChromeOS file browser.
 */
class OnExecuteEvent {
  /**
   * File browser action id as specified in the listener component's manifest.
   */
  final String id;

  /**
   * File handler execute event details.
   */
  final FileHandlerExecuteEventDetails details;

  OnExecuteEvent(this.id, this.details);
}

/**
 * Event details payload for fileBrowserHandler.onExecute event.
 */
class FileHandlerExecuteEventDetails extends ChromeObject {
  FileHandlerExecuteEventDetails({List<Object>? entries, int? tab_id}) {
    if (entries != null) this.entries = entries;
    if (tab_id != null) this.tab_id = tab_id;
  }
  FileHandlerExecuteEventDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Array of Entry instances representing files that are targets of this action
   * (selected in ChromeOS file browser).
   */
  List<Object> get entries => listify(jsProxy['entries']);
  set entries(List<Object> value) => jsProxy['entries'] = jsify(value);

  /**
   * The ID of the tab that raised this event. Tab IDs are unique within a
   * browser session.
   */
  int get tab_id => jsProxy['tab_id'];
  set tab_id(int value) => jsProxy['tab_id'] = value;
}

OnExecuteEvent _createOnExecuteEvent(String id, JsObject details) =>
    OnExecuteEvent(id, _createFileHandlerExecuteEventDetails(details));
FileHandlerExecuteEventDetails _createFileHandlerExecuteEventDetails(JsObject jsProxy) => FileHandlerExecuteEventDetails.fromProxy(jsProxy);

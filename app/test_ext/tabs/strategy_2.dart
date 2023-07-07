import 'dart:js_interop';

@JS('chrome.tabs')
external JSTabsApi get tabs;

@JS()
@staticInterop
class JSTabsApi {}

extension JSTabsApiExtension on JSTabsApi {
  external JSPromise query(JSQueryInfo? queryInfo);

  @JS('create')
  external void create(
      JSCreateProperties createProperties, JSFunction callback);
}

@JS()
@staticInterop
@anonymous
class JSQueryInfo {
  external factory JSQueryInfo({
    bool? active,
    bool? currentWindow,
    bool? pinned,
    JSTabStatus? status,
  });
}

@JS()
@staticInterop
@anonymous
class JSCreateProperties {
  external factory JSCreateProperties({
    bool? active,
    int? index,
    String? url,
  });
}

@JS('Tab')
@staticInterop
class JSTab {}

extension JSTabExtension on JSTab {
  external bool active;
  external int id;
  external String title;
  external JSTabStatus status;
}

typedef JSTabStatus = String;

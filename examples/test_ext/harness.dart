
import 'dart:js_interop';
import 'package:web/web.dart';

void main() {
  var button = document.querySelector('#startButton')! as HTMLElement;
  button.addEventListener(
      'click',
          (PointerEvent e) async {
        print('onClick ${e.width} ${e.timeStamp}');
        try {
          window.myFunction();
        } catch (e) {
          print('Catched error $e');
        }

      }.toJS);

  var r = window.myFunction();
  print('$r');

}

@JS()
@staticInterop
external Window get window;

@JS()
@staticInterop
class Window {}

extension on Window {
  external JSAny? myFunction();
}
/*
import 'dart:js_interop';
import 'dart:js_util';

// import 'package:test/html_enhanced_config.dart';
// import 'package:test/test.dart';
import 'package:logging/logging.dart';

// import 'package:chrome/gen/runtime.dart' as chrome;
import 'package:web/web.dart';
//import 'package:chrome/gen/notifications.dart' as chrome;
import 'tabs/strategy_1_high.dart';

void main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord r) => r.toString());

  //useHtmlEnhancedConfiguration();

  //html.window.onKeyUp.listen((html.KeyboardEvent event) {
  //  if (event.keyCode == html.KeyCode.R) {
  //    chrome.runtime.reload();
  //  }
  //});

  var button = document.querySelector('#startButton')! as EventTarget;
  button.addEventListener(
      'click',
      (PointerEvent e) async {
        print('onClick ${e.width} ${e.timeStamp}');

        print('Available: ${isAvailable}');
        if (isAvailable) {
          print('$notifications');
          notifications.create(
              '123',
              NotificationOptions(
                  message: "hello from chrome extension written in Dart",
                  title: "heyho",
                  type: "basic",
                  iconUrl: "dart_icon.png"),
              (a) {
                print("Got result $a");
              }.toJS);
          print('Notification: result');
        }
      }.toJS);

  var container = document.querySelector('#container')! as HTMLDivElement;
  container.appendChild(document.createElement('h1')..textContent = 'Tabs:');

  var allTabs = await tabs.query(queryInfo: QueryInfo(currentWindow: true));

  for (var tab in allTabs) {
    container.appendChild(document.createElement('p')
      ..textContent = '${tab.title} - ${tab.status}');
  }

  document.querySelector('#createButton')!.addEventListener(
      'click',
      (PointerEvent e) async {
        var tab = await tabs.create(active: false);
        print('Tab created event: ${tab.active} ${tab.title} ${tab.status}');
      }.toJS);

  tabs.onCreated.listen((event) {
    print('Tab created ${event.status} ${event.id}');
  });

  tabs.onMoved.listen((event) {
    print(
        'Tab moved ${event.tabId} ${event.moveInfo.windowId} ${event.moveInfo.fromIndex} ${event.moveInfo.toIndex}');
  });

  //container.children.add(document.createElement('h1')..innerText = 'Tabs:');

  /*button!.onClick.listen((e) async {
    print('Press button');

    print(chrome.runtime.available);
    print(chrome.runtime.getManifest());

    var result = await html.promiseToFuture(notifications
        .create(NotificationOptions(message: 'Hello from extension')));
    print('Notification: result');
  });*/

  // Possible Steps:
  // # Strategy 1: public binding
  //  - Generate the low level binding matching 1:1 with the JS
  //  - Generate a second layer that wrap entierly that layer and expose a higher
  //    level layer

  // # Strategy 2: group the low & high level layer in the same file and generate the binding in private

  // # Strategy 3: group the 2 layers but keep the low level public and have the high
  //   level be an extension of that layer.

  Logger.root.info("leaving main");
}

@JS('chrome.notifications')
external JSNotifications get notifications;

@JS('chrome.notifications')
external JSObject? get _notifications;

bool get isAvailable => _notifications != null;

@JS()
@staticInterop
class JSNotifications {}

typedef PermissionLevelCallback = JSFunction;
typedef PermissionLevel = JSString;

extension JSNotificationsExtension on JSNotifications {
  external bool available;
  external void create(
      String? id, NotificationOptions options, JSFunction callback);

  external void getPermissionLevel(PermissionLevelCallback callback);

  // The user changes the permission level.  As of Chrome 47, only ChromeOS
  // has UI that dispatches this event.
  Stream<PermissionLevel> get onPermissionLevelChanged =>
      throw UnimplementedError();
}

@JS()
@staticInterop
@anonymous
class NotificationOptions {
  external factory NotificationOptions({
    String message,
    String title,
    String type,
    String iconUrl,
  });
}

/*
@JS('chrome.tabs')
external TabsApi get tabs;

@JS()
@staticInterop
class TabsApi {}

extension TabsApiExtension on TabsApi {
  external JSPromise query([QueryInfo query]);
}

@JS()
@staticInterop
@anonymous
class QueryInfo {
  external factory QueryInfo({
    bool active,
    bool currentWindow,
    bool pinned,
    JSTabStatus status,
  });
}

@JS()
@staticInterop
class Tab {}

extension TabExtension on Tab {
  external bool active;
  external bool id;
  external String title;

  @JS('status')
  external JSTabStatus _status;
}

extension on Tab {
  TabStatus get status => TabStatus.values.byName(_status);
}

typedef JSTabStatus = String;

extension on JSTabStatus {
  // Not possible to have until inline class or something
  //TabStatus get toDart => TabStatus.values.byName(this);
}

enum TabStatus {
  unloaded('unloaded'),
  loading('loading'),
  complete('complete'),
  ;

  final String value;

  const TabStatus(this.value);

  JSTabStatus get toJs => value;
}
*/
*/
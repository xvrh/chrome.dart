import 'dart:async';
import 'dart:js_interop';
import 'dart:js_util';

import 'package:chrome/src/js/tabs.dart' as binding;

// tabs.dart
final tabs = TabsApi();

class TabsApi {
  Future<List<Tab>> query({QueryInfo? queryInfo}) async {
    var jsTab = await promiseToFuture<JSArray>(
        binding.chrome.tabs.query(queryInfo?.toJS ?? binding.QueryInfo()));
    return jsTab.toDart.map((JSAny? e) => (e! as binding.Tab).toDart).toList();
  }

  Future<Tab> create({
    bool? active,
    int? index,
    String? url,
  }) async {
    var jsTab = await promiseToFuture<binding.Tab>(binding.chrome.tabs.create(
        binding.CreateProperties(active: active, index: index, url: url)));
    return jsTab.toDart;
  }

  Stream<Tab> get onCreated {
    var controller = StreamController<Tab>.broadcast();

    var callback = (binding.Tab tab) {
      controller.add(tab.toDart);
    }.toJS;

    controller
      ..onListen = () {
        binding.chrome.tabs.onCreated.addListener(callback);
      }
      ..onCancel = () {
        binding.chrome.tabs.onCreated.removeListener(callback);
        controller.close();
      };

    return controller.stream;
  }

  Stream<OnMoveEvent> get onMoved {
    var controller = StreamController<OnMoveEvent>.broadcast();

    var callback = (int tabId, binding.OnMovedMoveInfo moveInfo) {
      controller.add(OnMoveEvent(tabId: tabId, moveInfo: MoveInfo._(moveInfo)));
    }.toJS;

    controller
      ..onListen = () {
        print('Add listener');
        binding.chrome.tabs.onMoved.addListener(callback);
      }
      ..onCancel = () {
        binding.chrome.tabs.onMoved.removeListener(callback);
        controller.close();
      };

    return controller.stream;
  }
}

class QueryInfo {
  final bool? active;
  final bool? currentWindow;
  final bool? pinned;
  final TabStatus? status;

  QueryInfo({
    this.active,
    this.currentWindow,
    this.pinned,
    this.status,
  });

  binding.QueryInfo get toJS => binding.QueryInfo(
        active: active,
        currentWindow: currentWindow,
        pinned: pinned,
        status: status?.toJS,
      );
}

class Tab {
  final String? title;
  final bool active;
  final int? id;
  final TabStatus? status;

  Tab({
    required this.title,
    required this.active,
    required this.id,
    required this.status,
  });
}

extension on binding.Tab {
  Tab get toDart => Tab(
        title: title,
        active: active,
        id: id,
        status: status != null ? TabStatus._fromJS(status!) : null,
      );
}

enum TabStatus {
  unloaded('unloaded'),
  loading('loading'),
  complete('complete'),
  ;

  final String value;

  const TabStatus(this.value);

  static TabStatus _fromJS(binding.TabStatus status) =>
      TabStatus.values.firstWhere((e) => e.value == status);

  binding.TabStatus get toJS => value;
}

class OnMoveEvent {
  final int tabId;
  final MoveInfo moveInfo;

  OnMoveEvent({required this.tabId, required this.moveInfo});
}

class MoveInfo {
  final binding.OnMovedMoveInfo _object;

  // Questions:
  //  - Should we always generate setter
  //  - How to create this object?
  //  - Sometime we want an "output" object (like here). But sometime we need
  //    an "input" object.
  // 2 Strategy: have a pure Dart object and generate .toDart .toJS functions on
  // the side
  //   => problem is: it is not possible to update an original object when changing
  //      the properties. This is good for immutable classes.
  //      We need to discover if the properties are mutable or not.
  //      Having just a wrapper arround a JS object allows to optimize it when
  //      we have Inline class?

  int get windowId => _object.windowId;
  int get fromIndex => _object.fromIndex;
  int get toIndex => _object.toIndex;

  MoveInfo._(this._object);

  MoveInfo(
      {required int windowId, required int fromIndex, required int toIndex})
      : _object = binding.OnMovedMoveInfo()
          ..windowId = windowId
          ..fromIndex = fromIndex
          ..toIndex = toIndex;
}

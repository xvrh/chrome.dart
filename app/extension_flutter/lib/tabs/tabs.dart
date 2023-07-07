import 'dart:async';
import 'dart:js_interop';
import 'dart:js_util';

import 'js.dart' as binding;

// tabs.dart
final tabs = TabsApi();

class TabsApi {
  Future<List<Tab>> query({QueryInfo? queryInfo}) async {
    var jsTab = await promiseToFuture<JSArray>(
        binding.tabs.query(queryInfo?.toJS ?? binding.JSQueryInfo()));
    return jsTab.toDart
        .map((JSAny? e) => (e! as binding.JSTab).toDart)
        .toList();
  }

  Future<Tab> create({
    bool? active,
    int? index,
    String? url,
  }) async {
    var completer = Completer<Tab>();
    binding.tabs.create(
      binding.JSCreateProperties(active: active, index: index, url: url),
      (binding.JSTab tab) {
        completer.complete(tab.toDart);
      }.toJS,
    );
    return completer.future;
  }

  Stream<Tab> get onCreated {
    var controller = StreamController<Tab>.broadcast();

    var callback = (binding.JSTab tab) {
      controller.add(tab.toDart);
    }.toJS;

    controller
      ..onListen = () {
        binding.tabs.onCreated.addListener(callback);
      }
      ..onCancel = () {
        binding.tabs.onCreated.removeListener(callback);
        controller.close();
      };

    return controller.stream;
  }

  Stream<OnMoveEvent> get onMoved {
    var controller = StreamController<OnMoveEvent>.broadcast();

    var callback = (int tabId, binding.JSMoveInfo moveInfo) {
      controller.add(OnMoveEvent(tabId: tabId, moveInfo: MoveInfo._(moveInfo)));
    }.toJS;

    controller
      ..onListen = () {
        print('Add listener');
        binding.tabs.onMoved.addListener(callback);
      }
      ..onCancel = () {
        binding.tabs.onMoved.removeListener(callback);
        controller.close();
      };

    return controller.stream;
  }

  Stream<({int tabId, ({int windowId, int fromIndex, int toIndex}) moveInfo})>
      get onMoved2 {
    var controller = StreamController<
        ({
          int tabId,
          ({int windowId, int fromIndex, int toIndex}) moveInfo
        })>.broadcast();

    var callback = (int tabId, binding.JSMoveInfo moveInfo) {
      controller.add((tabId: tabId, moveInfo: moveInfo.toRecord));
    }.toJS;

    controller
      ..onListen = () {
        print('Add listener');
        binding.tabs.onMoved.addListener(callback);
      }
      ..onCancel = () {
        binding.tabs.onMoved.removeListener(callback);
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

  binding.JSQueryInfo get toJS => binding.JSQueryInfo(
        active: active,
        currentWindow: currentWindow,
        pinned: pinned,
        status: status?.toJS,
      );
}

class Tab {
  final String? title;
  final bool active;
  final int id;
  final TabStatus status;

  Tab({
    required this.title,
    required this.active,
    required this.id,
    required this.status,
  });
}

extension on binding.JSTab {
  Tab get toDart => Tab(
        title: title,
        active: active,
        id: id,
        status: TabStatus._fromJS(status),
      );
}

enum TabStatus {
  unloaded('unloaded'),
  loading('loading'),
  complete('complete'),
  ;

  final String value;

  const TabStatus(this.value);

  static TabStatus _fromJS(binding.JSTabStatus status) =>
      TabStatus.values.firstWhere((e) => e.value == status);

  binding.JSTabStatus get toJS => value;
}

class OnMoveEvent {
  final int tabId;
  final MoveInfo moveInfo;

  OnMoveEvent({required this.tabId, required this.moveInfo});
}

class MoveInfo {
  final binding.JSMoveInfo _object;

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
      : _object = binding.JSMoveInfo()
          ..windowId = windowId
          ..fromIndex = fromIndex
          ..toIndex = toIndex;
}

extension on binding.JSMoveInfo {
  ({int windowId, int fromIndex, int toIndex}) get toRecord => (
        windowId: windowId,
        fromIndex: fromIndex,
        toIndex: toIndex,
      );
}

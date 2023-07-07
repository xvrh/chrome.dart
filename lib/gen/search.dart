/* This file has been generated from search.idl - do not edit */

/**
 * Use the `chrome.search` API to search via the default provider.
 */
library chrome.search;

import '../src/common.dart';

/**
 * Accessor for the `chrome.search` namespace.
 */
final ChromeSearch search = ChromeSearch._();

class ChromeSearch extends ChromeApi {
  JsObject get _search => chrome['search'];

  ChromeSearch._();

  bool get available => _search != null;

  /**
   * Used to query the default search provider. In case of an error,
   * [runtime.lastError] will be set.
   */
  Future query(QueryInfo queryInfo) {
    if (_search == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _search.callMethod('query', [jsify(queryInfo), completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.search' is not available");
  }
}

class Disposition extends ChromeEnum {
  static const Disposition CURRENT_TAB = const Disposition._('CURRENT_TAB');
  static const Disposition NEW_TAB = const Disposition._('NEW_TAB');
  static const Disposition NEW_WINDOW = const Disposition._('NEW_WINDOW');

  static const List<Disposition> VALUES = const[CURRENT_TAB, NEW_TAB, NEW_WINDOW];

  const Disposition._(String str): super(str);
}

class QueryInfo extends ChromeObject {
  QueryInfo({String? text, Disposition? disposition, int? tabId}) {
    if (text != null) this.text = text;
    if (disposition != null) this.disposition = disposition;
    if (tabId != null) this.tabId = tabId;
  }
  QueryInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get text => jsProxy['text'];
  set text(String value) => jsProxy['text'] = value;

  Disposition get disposition => _createDisposition(jsProxy['disposition']);
  set disposition(Disposition value) => jsProxy['disposition'] = jsify(value);

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

Disposition _createDisposition(String value) => Disposition.VALUES.singleWhere((ChromeEnum e) => e.value == value);

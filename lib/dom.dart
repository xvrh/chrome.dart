import 'chrome.dart';
export 'chrome.dart';

final _dom = ChromeDom._();

extension ChromeDomExtension on Chrome {
  ChromeDom get dom => _dom;
}

class ChromeDom {
  ChromeDom._();

  /// Gets the open shadow root or the closed shadow root hosted by the
  /// specified element. If the element doesn't attach the shadow root, it will
  /// return null.
  void openOrClosedShadowRoot(element) => throw UnimplementedError();
}

import 'src/internal_helpers.dart';
import 'src/js/dom.dart' as $js;
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
  JSAny openOrClosedShadowRoot(JSObject element) => throw UnimplementedError();
}

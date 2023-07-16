
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
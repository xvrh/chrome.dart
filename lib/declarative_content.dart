import 'chrome.dart';
export 'chrome.dart';

final _declarativeContent = ChromeDeclarativeContent._();

extension ChromeChromeDeclarativeContentExtension on Chrome {
  ChromeDeclarativeContent get declarativeContent => _declarativeContent;
}

class ChromeDeclarativeContent {
  ChromeDeclarativeContent._();
}

enum PageStateMatcherInstanceType {
  declarativeContentPageStateMatcher('declarativeContent.PageStateMatcher');

  const PageStateMatcherInstanceType(this.value);

  final String value;
}

enum ShowPageActionInstanceType {
  declarativeContentShowPageAction('declarativeContent.ShowPageAction');

  const ShowPageActionInstanceType(this.value);

  final String value;
}

enum ShowActionInstanceType {
  declarativeContentShowAction('declarativeContent.ShowAction');

  const ShowActionInstanceType(this.value);

  final String value;
}

enum SetIconInstanceType {
  declarativeContentSetIcon('declarativeContent.SetIcon');

  const SetIconInstanceType(this.value);

  final String value;
}

enum RequestContentScriptInstanceType {
  declarativeContentRequestContentScript(
      'declarativeContent.RequestContentScript');

  const RequestContentScriptInstanceType(this.value);

  final String value;
}

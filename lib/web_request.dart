import 'chrome.dart';
export 'chrome.dart';

final _webRequest = ChromeWebRequest._();

extension ChromeChromeWebRequestExtension on Chrome {
  ChromeWebRequest get webRequest => _webRequest;
}

class ChromeWebRequest {
  ChromeWebRequest._();
}

enum ResourceType {
  mainFrame('main_frame'),
  subFrame('sub_frame'),
  stylesheet('stylesheet'),
  script('script'),
  image('image'),
  font('font'),
  object('object'),
  xmlhttprequest('xmlhttprequest'),
  ping('ping'),
  cspReport('csp_report'),
  media('media'),
  websocket('websocket'),
  webbundle('webbundle'),
  other('other');

  const ResourceType(this.value);

  final String value;
}

enum OnBeforeRequestOptions {
  blocking('blocking'),
  requestBody('requestBody'),
  extraHeaders('extraHeaders');

  const OnBeforeRequestOptions(this.value);

  final String value;
}

enum OnBeforeSendHeadersOptions {
  requestHeaders('requestHeaders'),
  blocking('blocking'),
  extraHeaders('extraHeaders');

  const OnBeforeSendHeadersOptions(this.value);

  final String value;
}

enum OnSendHeadersOptions {
  requestHeaders('requestHeaders'),
  extraHeaders('extraHeaders');

  const OnSendHeadersOptions(this.value);

  final String value;
}

enum OnHeadersReceivedOptions {
  blocking('blocking'),
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnHeadersReceivedOptions(this.value);

  final String value;
}

enum OnAuthRequiredOptions {
  responseHeaders('responseHeaders'),
  blocking('blocking'),
  asyncBlocking('asyncBlocking'),
  extraHeaders('extraHeaders');

  const OnAuthRequiredOptions(this.value);

  final String value;
}

enum OnResponseStartedOptions {
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnResponseStartedOptions(this.value);

  final String value;
}

enum OnBeforeRedirectOptions {
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnBeforeRedirectOptions(this.value);

  final String value;
}

enum OnCompletedOptions {
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnCompletedOptions(this.value);

  final String value;
}

enum OnErrorOccurredOptions {
  extraHeaders('extraHeaders');

  const OnErrorOccurredOptions(this.value);

  final String value;
}

enum IgnoredActionType {
  redirect('redirect'),
  requestHeaders('request_headers'),
  responseHeaders('response_headers'),
  authCredentials('auth_credentials');

  const IgnoredActionType(this.value);

  final String value;
}

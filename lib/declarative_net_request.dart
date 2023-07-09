import 'chrome.dart';
export 'chrome.dart';

final _declarativeNetRequest = ChromeDeclarativeNetRequest._();

extension ChromeChromeDeclarativeNetRequestExtension on Chrome {
  ChromeDeclarativeNetRequest get declarativeNetRequest =>
      _declarativeNetRequest;
}

class ChromeDeclarativeNetRequest {
  ChromeDeclarativeNetRequest._();
}

///  This describes the resource type of the network request.
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
  webtransport('webtransport'),
  webbundle('webbundle'),
  other('other');

  const ResourceType(this.value);

  final String value;
}

///  This describes the HTTP request method of a network request.
enum RequestMethod {
  connect('connect'),
  delete('delete'),
  get('get'),
  head('head'),
  options('options'),
  patch('patch'),
  post('post'),
  put('put'),
  other('other');

  const RequestMethod(this.value);

  final String value;
}

///  This describes whether the request is first or third party to the frame in
///  which it originated. A request is said to be first party if it has the same
///  domain (eTLD+1) as the frame in which the request originated.
enum DomainType {
  ///  The network request is first party to the frame in which it originated.
  firstParty('firstParty'),

  ///  The network request is third party to the frame in which it originated.
  thirdParty('thirdParty');

  const DomainType(this.value);

  final String value;
}

///  This describes the possible operations for a "modifyHeaders" rule.
enum HeaderOperation {
  ///  Adds a new entry for the specified header. This operation is not
  ///  supported for request headers.
  append('append'),

  ///  Sets a new value for the specified header, removing any existing headers
  ///  with the same name.
  set('set'),

  ///  Removes all entries for the specified header.
  remove('remove');

  const HeaderOperation(this.value);

  final String value;
}

///  Describes the kind of action to take if a given RuleCondition matches.
enum RuleActionType {
  ///  Block the network request.
  block('block'),

  ///  Redirect the network request.
  redirect('redirect'),

  ///  Allow the network request. The request won't be intercepted if there is
  ///  an allow rule which matches it.
  allow('allow'),

  ///  Upgrade the network request url's scheme to https if the request is http
  ///  or ftp.
  upgradeScheme('upgradeScheme'),

  ///  Modify request/response headers from the network request.
  modifyHeaders('modifyHeaders'),

  ///  Allow all requests within a frame hierarchy, including the frame request
  ///  itself.
  allowAllRequests('allowAllRequests');

  const RuleActionType(this.value);

  final String value;
}

///  Describes the reason why a given regular expression isn't supported.
enum UnsupportedRegexReason {
  ///  The regular expression is syntactically incorrect, or uses features
  ///  not available in the
  ///  <a href = "https://github.com/google/re2/wiki/Syntax">RE2 syntax</a>.
  syntaxError('syntaxError'),

  ///  The regular expression exceeds the memory limit.
  memoryLimitExceeded('memoryLimitExceeded');

  const UnsupportedRegexReason(this.value);

  final String value;
}

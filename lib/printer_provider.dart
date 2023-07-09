import 'chrome.dart';
export 'chrome.dart';

final _printerProvider = ChromePrinterProvider._();

extension ChromeChromePrinterProviderExtension on Chrome {
  ChromePrinterProvider get printerProvider => _printerProvider;
}

class ChromePrinterProvider {
  ChromePrinterProvider._();
}

///  Error codes returned in response to $(ref:onPrintRequested) event.
enum PrintError {
  ///  Operation completed successfully.
  ok('OK'),

  ///  General failure.
  failed('FAILED'),

  ///  Print ticket is invalid. For example, ticket is inconsistent with
  ///  capabilities or extension is not able to handle all settings from the
  ///  ticket.
  invalidTICKET('INVALID_TICKET'),

  ///  Document is invalid. For example, data may be corrupted or the format is
  ///  incompatible with the extension.
  invalidDATA('INVALID_DATA');

  const PrintError(this.value);

  final String value;
}

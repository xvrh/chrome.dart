import 'chrome.dart';
export 'chrome.dart';

final _printerProvider = ChromePrinterProvider._();

extension ChromeChromePrinterProviderExtension on Chrome {
  ChromePrinterProvider get printerProvider => _printerProvider;
}

class ChromePrinterProvider {
  ChromePrinterProvider._();

  ///  Event fired when print manager requests printers provided by extensions.
  ///  |resultCallback|: Callback to return printer list. Every listener must
  ///  call callback exactly once.
  Stream get onGetPrintersRequested => throw UnimplementedError();

  ///  Event fired when print manager requests information about a USB device
  ///  that may be a printer.
  ///  <p><em>Note:</em> An application should not rely on this event being
  ///  fired more than once per device. If a connected device is supported it
  ///  should be returned in the $(ref:onGetPrintersRequested) event.</p>
  ///  |device|: The USB device.
  ///  |resultCallback|: Callback to return printer info. The receiving listener
  ///  must call callback exactly once. If the parameter to this callback is
  ///  undefined that indicates that the application has determined that the
  ///  device is not supported.
  Stream get onGetUsbPrinterInfoRequested => throw UnimplementedError();

  ///  Event fired when print manager requests printer capabilities.
  ///  |printerId|: Unique ID of the printer whose capabilities are requested.
  ///  |resultCallback|: Callback to return device capabilities in
  ///  <a href="https://developers.google.com/cloud-print/docs/cdd#cdd">CDD
  ///  format</a>.
  ///  The receiving listener must call callback exectly once.
  Stream get onGetCapabilityRequested => throw UnimplementedError();

  ///  Event fired when print manager requests printing.
  ///  |printJob|: The printing request parameters.
  ///  |resultCallback|: Callback that should be called when the printing
  ///  request is completed.
  Stream get onPrintRequested => throw UnimplementedError();
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

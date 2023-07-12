import 'src/internal_helpers.dart';
import 'usb.dart';
import 'src/js/printer_provider.dart' as $js;
export 'chrome.dart';

final _printerProvider = ChromePrinterProvider._();

extension ChromePrinterProviderExtension on Chrome {
  ChromePrinterProvider get printerProvider => _printerProvider;
}

class ChromePrinterProvider {
  ChromePrinterProvider._();

  /// Event fired when print manager requests printers provided by extensions.
  /// |resultCallback|: Callback to return printer list. Every listener must
  /// call callback exactly once.
  Stream<PrintersCallback> get onGetPrintersRequested =>
      throw UnimplementedError();

  /// Event fired when print manager requests information about a USB device
  /// that may be a printer.
  /// _Note:_ An application should not rely on this event being
  /// fired more than once per device. If a connected device is supported it
  /// should be returned in the [onGetPrintersRequested] event.
  /// |device|: The USB device.
  /// |resultCallback|: Callback to return printer info. The receiving listener
  /// must call callback exactly once. If the parameter to this callback is
  /// undefined that indicates that the application has determined that the
  /// device is not supported.
  Stream<OnGetUsbPrinterInfoRequestedEvent> get onGetUsbPrinterInfoRequested =>
      throw UnimplementedError();

  /// Event fired when print manager requests printer capabilities.
  /// |printerId|: Unique ID of the printer whose capabilities are requested.
  /// |resultCallback|: Callback to return device capabilities in
  /// <a href="https://developers.google.com/cloud-print/docs/cdd#cdd">CDD
  /// format</a>.
  /// The receiving listener must call callback exectly once.
  Stream<OnGetCapabilityRequestedEvent> get onGetCapabilityRequested =>
      throw UnimplementedError();

  /// Event fired when print manager requests printing.
  /// |printJob|: The printing request parameters.
  /// |resultCallback|: Callback that should be called when the printing
  /// request is completed.
  Stream<OnPrintRequestedEvent> get onPrintRequested =>
      throw UnimplementedError();
}

/// Error codes returned in response to [onPrintRequested] event.
enum PrintError {
  /// Operation completed successfully.
  ok('OK'),

  /// General failure.
  failed('FAILED'),

  /// Print ticket is invalid. For example, ticket is inconsistent with
  /// capabilities or extension is not able to handle all settings from the
  /// ticket.
  invalidTicket('INVALID_TICKET'),

  /// Document is invalid. For example, data may be corrupted or the format is
  /// incompatible with the extension.
  invalidData('INVALID_DATA');

  const PrintError(this.value);

  final String value;

  String get toJS => value;
  static PrintError fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

typedef PrintersCallback = void Function(List<PrinterInfo>);

typedef PrinterInfoCallback = void Function(PrinterInfo?);

/// |capabilities|: Device capabilities in
/// <a href="https://developers.google.com/cloud-print/docs/cdd#cdd">CDD
/// format</a>.
typedef CapabilitiesCallback = void Function(JSAny);

typedef PrintCallback = void Function(PrintError);

class PrinterInfo {
  PrinterInfo.fromJS(this._wrapped);

  final $js.PrinterInfo _wrapped;

  $js.PrinterInfo get toJS => _wrapped;

  /// Unique printer ID.
  String get id => _wrapped.id;
  set id(String v) {
    throw UnimplementedError();
  }

  /// Printer's human readable name.
  String get name => _wrapped.name;
  set name(String v) {
    throw UnimplementedError();
  }

  /// Printer's human readable description.
  String? get description => _wrapped.description;
  set description(String? v) {
    throw UnimplementedError();
  }
}

class PrintJob {
  PrintJob.fromJS(this._wrapped);

  final $js.PrintJob _wrapped;

  $js.PrintJob get toJS => _wrapped;

  /// ID of the printer which should handle the job.
  String get printerId => _wrapped.printerId;
  set printerId(String v) {
    throw UnimplementedError();
  }

  /// The print job title.
  String get title => _wrapped.title;
  set title(String v) {
    throw UnimplementedError();
  }

  /// Print ticket in
  /// <a href="https://developers.google.com/cloud-print/docs/cdd#cjt">
  /// CJT format</a>.
  JSAny get ticket => _wrapped.ticket;
  set ticket(JSAny v) {
    throw UnimplementedError();
  }

  /// The document content type. Supported formats are
  /// `"application/pdf"` and `"image/pwg-raster"`.
  String get contentType => _wrapped.contentType;
  set contentType(String v) {
    throw UnimplementedError();
  }

  /// Blob containing the document data to print. Format must match
  /// |contentType|.
  JSObject get document => _wrapped.document;
  set document(JSObject v) {
    throw UnimplementedError();
  }
}

class OnGetUsbPrinterInfoRequestedEvent {
  OnGetUsbPrinterInfoRequestedEvent({
    required this.device,
    required this.resultCallback,
  });

  final Device device;

  final PrinterInfoCallback resultCallback;
}

class OnGetCapabilityRequestedEvent {
  OnGetCapabilityRequestedEvent({
    required this.printerId,
    required this.resultCallback,
  });

  final String printerId;

  final CapabilitiesCallback resultCallback;
}

class OnPrintRequestedEvent {
  OnPrintRequestedEvent({
    required this.printJob,
    required this.resultCallback,
  });

  final PrintJob printJob;

  final PrintCallback resultCallback;
}

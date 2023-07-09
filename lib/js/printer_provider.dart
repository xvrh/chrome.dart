import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSPrinterProviderExtension on JSChrome {
  ///  The `chrome.printerProvider` API exposes events used by print
  ///  manager to query printers controlled by extensions, to query their
  ///  capabilities and to submit print jobs to these printers.
  external JSPrinterProvider get printerProvider;
}

@JS()
@staticInterop
class JSPrinterProvider {}

extension JSPrinterProviderExtension on JSPrinterProvider {
  ///  Event fired when print manager requests printers provided by extensions.
  ///  |resultCallback|: Callback to return printer list. Every listener must
  ///  call callback exactly once.
  external ChromeEvent get onGetPrintersRequested;

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
  external ChromeEvent get onGetUsbPrinterInfoRequested;

  ///  Event fired when print manager requests printer capabilities.
  ///  |printerId|: Unique ID of the printer whose capabilities are requested.
  ///  |resultCallback|: Callback to return device capabilities in
  ///  <a href="https://developers.google.com/cloud-print/docs/cdd#cdd">CDD
  ///  format</a>.
  ///  The receiving listener must call callback exectly once.
  external ChromeEvent get onGetCapabilityRequested;

  ///  Event fired when print manager requests printing.
  ///  |printJob|: The printing request parameters.
  ///  |resultCallback|: Callback that should be called when the printing
  ///  request is completed.
  external ChromeEvent get onPrintRequested;
}

@JS()
@staticInterop
class PrinterInfo {
  ///  Unique printer ID.
  external JSAny get id;

  ///  Printer's human readable name.
  external JSAny get name;

  ///  Printer's human readable description.
  external JSAny? get description;
}

@JS()
@staticInterop
class PrintJob {
  ///  ID of the printer which should handle the job.
  external JSAny get printerId;

  ///  The print job title.
  external JSAny get title;

  ///  Print ticket in
  ///  <a href="https://developers.google.com/cloud-print/docs/cdd#cjt">
  ///  CJT format</a>.
  external JSAny get ticket;

  ///  The document content type. Supported formats are
  ///  `"application/pdf"` and `"image/pwg-raster"`.
  external JSAny get contentType;

  ///  Blob containing the document data to print. Format must match
  ///  |contentType|.
  external JSAny get document;
}

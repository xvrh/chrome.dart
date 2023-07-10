/* This file has been generated from printer_provider.idl - do not edit */

/**
 * The `chrome.printerProvider` API exposes events used by print manager to
 * query printers controlled by extensions, to query their capabilities and to
 * submit print jobs to these printers.
 */
library chrome.printerProvider;

import '../src/files.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.printerProvider` namespace.
 */
final ChromePrinterProvider printerProvider = ChromePrinterProvider._();

class ChromePrinterProvider extends ChromeApi {
  JsObject get _printerProvider => chrome['printerProvider'];

  Stream<PrintersCallback> get onGetPrintersRequested => _onGetPrintersRequested.stream;
  late ChromeStreamController<PrintersCallback> _onGetPrintersRequested;

  Stream<OnGetUsbPrinterInfoRequestedEvent> get onGetUsbPrinterInfoRequested => _onGetUsbPrinterInfoRequested.stream;
  late ChromeStreamController<OnGetUsbPrinterInfoRequestedEvent> _onGetUsbPrinterInfoRequested;

  Stream<OnGetCapabilityRequestedEvent> get onGetCapabilityRequested => _onGetCapabilityRequested.stream;
  late ChromeStreamController<OnGetCapabilityRequestedEvent> _onGetCapabilityRequested;

  Stream<OnPrintRequestedEvent> get onPrintRequested => _onPrintRequested.stream;
  late ChromeStreamController<OnPrintRequestedEvent> _onPrintRequested;

  ChromePrinterProvider._() {
    var getApi = () => _printerProvider;
    _onGetPrintersRequested = ChromeStreamController<PrintersCallback>.oneArg(getApi, 'onGetPrintersRequested', _createPrintersCallback);
    _onGetUsbPrinterInfoRequested = ChromeStreamController<OnGetUsbPrinterInfoRequestedEvent>.twoArgs(getApi, 'onGetUsbPrinterInfoRequested', _createOnGetUsbPrinterInfoRequestedEvent);
    _onGetCapabilityRequested = ChromeStreamController<OnGetCapabilityRequestedEvent>.twoArgs(getApi, 'onGetCapabilityRequested', _createOnGetCapabilityRequestedEvent);
    _onPrintRequested = ChromeStreamController<OnPrintRequestedEvent>.twoArgs(getApi, 'onPrintRequested', _createOnPrintRequestedEvent);
  }

  bool get available => _printerProvider != null;
}

class OnGetUsbPrinterInfoRequestedEvent {
  final usb.Device device;

  final PrinterInfoCallback resultCallback;

  OnGetUsbPrinterInfoRequestedEvent(this.device, this.resultCallback);
}

class OnGetCapabilityRequestedEvent {
  final String printerId;

  final CapabilitiesCallback resultCallback;

  OnGetCapabilityRequestedEvent(this.printerId, this.resultCallback);
}

class OnPrintRequestedEvent {
  final PrintJob printJob;

  final PrintCallback resultCallback;

  OnPrintRequestedEvent(this.printJob, this.resultCallback);
}

/**
 * Error codes returned in response to [onPrintRequested] event.
 */
class PrintError extends ChromeEnum {
  static const PrintError OK = const PrintError._('OK');
  static const PrintError FAILED = const PrintError._('FAILED');
  static const PrintError INVALID_TICKET = const PrintError._('INVALID_TICKET');
  static const PrintError INVALID_DATA = const PrintError._('INVALID_DATA');

  static const List<PrintError> VALUES = const[OK, FAILED, INVALID_TICKET, INVALID_DATA];

  const PrintError._(String str): super(str);
}

/**
 * Printer description for [onGetPrintersRequested] event.
 */
class PrinterInfo extends ChromeObject {
  PrinterInfo({String? id, String? name, String? description}) {
    if (id != null) this.id = id;
    if (name != null) this.name = name;
    if (description != null) this.description = description;
  }
  PrinterInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  String get name => jsProxy['name'];
  set name(String value) => jsProxy['name'] = value;

  String get description => jsProxy['description'];
  set description(String value) => jsProxy['description'] = value;
}

/**
 * Printing request parameters. Passed to [onPrintRequested] event.
 */
class PrintJob extends ChromeObject {
  PrintJob({String? printerId, String? title, Object? ticket, String? contentType, Blob? document}) {
    if (printerId != null) this.printerId = printerId;
    if (title != null) this.title = title;
    if (ticket != null) this.ticket = ticket;
    if (contentType != null) this.contentType = contentType;
    if (document != null) this.document = document;
  }
  PrintJob.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get printerId => jsProxy['printerId'];
  set printerId(String value) => jsProxy['printerId'] = value;

  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  Object get ticket => jsProxy['ticket'];
  set ticket(Object value) => jsProxy['ticket'] = jsify(value);

  String get contentType => jsProxy['contentType'];
  set contentType(String value) => jsProxy['contentType'] = value;

  Blob get document => _createBlob(jsProxy['document']);
  set document(Blob value) => jsProxy['document'] = jsify(value);
}

PrintersCallback _createPrintersCallback(JsObject jsProxy) => PrintersCallback.fromProxy(jsProxy);
OnGetUsbPrinterInfoRequestedEvent _createOnGetUsbPrinterInfoRequestedEvent(JsObject device, JsObject resultCallback) =>
    OnGetUsbPrinterInfoRequestedEvent(_createusb.Device(device), _createPrinterInfoCallback(resultCallback));
OnGetCapabilityRequestedEvent _createOnGetCapabilityRequestedEvent(String printerId, JsObject resultCallback) =>
    OnGetCapabilityRequestedEvent(printerId, _createCapabilitiesCallback(resultCallback));
OnPrintRequestedEvent _createOnPrintRequestedEvent(JsObject printJob, JsObject resultCallback) =>
    OnPrintRequestedEvent(_createPrintJob(printJob), _createPrintCallback(resultCallback));
Blob _createBlob(JsObject jsProxy) => CrBlob.fromProxy(jsProxy);
usb.Device _createusb.Device(JsObject jsProxy) => usb.Device.fromProxy(jsProxy);
PrinterInfoCallback _createPrinterInfoCallback(JsObject jsProxy) => PrinterInfoCallback.fromProxy(jsProxy);
CapabilitiesCallback _createCapabilitiesCallback(JsObject jsProxy) => CapabilitiesCallback.fromProxy(jsProxy);
PrintJob _createPrintJob(JsObject jsProxy) => PrintJob.fromProxy(jsProxy);
PrintCallback _createPrintCallback(JsObject jsProxy) => PrintCallback.fromProxy(jsProxy);
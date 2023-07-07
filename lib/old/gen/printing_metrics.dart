/* This file has been generated from printing_metrics.idl - do not edit */

/**
 * Use the `chrome.printingMetrics` API to fetch data about printing usage.
 */
library chrome.printingMetrics;

import '../src/common.dart';

/**
 * Accessor for the `chrome.printingMetrics` namespace.
 */
final ChromePrintingMetrics printingMetrics = ChromePrintingMetrics._();

class ChromePrintingMetrics extends ChromeApi {
  JsObject get _printingMetrics => chrome['printingMetrics'];

  Stream<PrintJobInfo> get onPrintJobFinished => _onPrintJobFinished.stream;
  late ChromeStreamController<PrintJobInfo> _onPrintJobFinished;

  ChromePrintingMetrics._() {
    var getApi = () => _printingMetrics;
    _onPrintJobFinished = ChromeStreamController<PrintJobInfo>.oneArg(getApi, 'onPrintJobFinished', _createPrintJobInfo);
  }

  bool get available => _printingMetrics != null;

  /**
   * Returns the list of the finished print jobs.
   */
  Future<List<PrintJobInfo>> getPrintJobs() {
    if (_printingMetrics == null) _throwNotAvailable();

    var completer =  ChromeCompleter<List<PrintJobInfo>>.oneArg((e) => listify(e, _createPrintJobInfo));
    _printingMetrics.callMethod('getPrintJobs', [completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.printingMetrics' is not available");
  }
}

/**
 * The source of the print job.
 */
class PrintJobSource extends ChromeEnum {
  static const PrintJobSource PRINT_PREVIEW = const PrintJobSource._('PRINT_PREVIEW');
  static const PrintJobSource ANDROID_APP = const PrintJobSource._('ANDROID_APP');
  static const PrintJobSource EXTENSION = const PrintJobSource._('EXTENSION');

  static const List<PrintJobSource> VALUES = const[PRINT_PREVIEW, ANDROID_APP, EXTENSION];

  const PrintJobSource._(String str): super(str);
}

/**
 * The final status of the print job.
 */
class PrintJobStatus extends ChromeEnum {
  static const PrintJobStatus FAILED = const PrintJobStatus._('FAILED');
  static const PrintJobStatus CANCELED = const PrintJobStatus._('CANCELED');
  static const PrintJobStatus PRINTED = const PrintJobStatus._('PRINTED');

  static const List<PrintJobStatus> VALUES = const[FAILED, CANCELED, PRINTED];

  const PrintJobStatus._(String str): super(str);
}

/**
 * The source of the printer.
 */
class PrinterSource extends ChromeEnum {
  static const PrinterSource USER = const PrinterSource._('USER');
  static const PrinterSource POLICY = const PrinterSource._('POLICY');

  static const List<PrinterSource> VALUES = const[USER, POLICY];

  const PrinterSource._(String str): super(str);
}

class ColorMode extends ChromeEnum {
  static const ColorMode BLACK_AND_WHITE = const ColorMode._('BLACK_AND_WHITE');
  static const ColorMode COLOR = const ColorMode._('COLOR');

  static const List<ColorMode> VALUES = const[BLACK_AND_WHITE, COLOR];

  const ColorMode._(String str): super(str);
}

class DuplexMode extends ChromeEnum {
  static const DuplexMode ONE_SIDED = const DuplexMode._('ONE_SIDED');
  static const DuplexMode TWO_SIDED_LONG_EDGE = const DuplexMode._('TWO_SIDED_LONG_EDGE');
  static const DuplexMode TWO_SIDED_SHORT_EDGE = const DuplexMode._('TWO_SIDED_SHORT_EDGE');

  static const List<DuplexMode> VALUES = const[ONE_SIDED, TWO_SIDED_LONG_EDGE, TWO_SIDED_SHORT_EDGE];

  const DuplexMode._(String str): super(str);
}

/**
 * The size of requested media.
 */
class MediaSize extends ChromeObject {
  MediaSize({int? width, int? height, String? vendorId}) {
    if (width != null) this.width = width;
    if (height != null) this.height = height;
    if (vendorId != null) this.vendorId = vendorId;
  }
  MediaSize.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get width => jsProxy['width'];
  set width(int value) => jsProxy['width'] = value;

  int get height => jsProxy['height'];
  set height(int value) => jsProxy['height'] = value;

  String get vendorId => jsProxy['vendorId'];
  set vendorId(String value) => jsProxy['vendorId'] = value;
}

/**
 * The requested settings of print job.
 */
class PrintSettings extends ChromeObject {
  PrintSettings({ColorMode? color, DuplexMode? duplex, MediaSize? mediaSize, int? copies}) {
    if (color != null) this.color = color;
    if (duplex != null) this.duplex = duplex;
    if (mediaSize != null) this.mediaSize = mediaSize;
    if (copies != null) this.copies = copies;
  }
  PrintSettings.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  ColorMode get color => _createColorMode(jsProxy['color']);
  set color(ColorMode value) => jsProxy['color'] = jsify(value);

  DuplexMode get duplex => _createDuplexMode(jsProxy['duplex']);
  set duplex(DuplexMode value) => jsProxy['duplex'] = jsify(value);

  MediaSize get mediaSize => _createMediaSize(jsProxy['mediaSize']);
  set mediaSize(MediaSize value) => jsProxy['mediaSize'] = jsify(value);

  int get copies => jsProxy['copies'];
  set copies(int value) => jsProxy['copies'] = value;
}

/**
 * The printer info.
 */
class Printer extends ChromeObject {
  Printer({String? name, String? uri, PrinterSource? source}) {
    if (name != null) this.name = name;
    if (uri != null) this.uri = uri;
    if (source != null) this.source = source;
  }
  Printer.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get name => jsProxy['name'];
  set name(String value) => jsProxy['name'] = value;

  String get uri => jsProxy['uri'];
  set uri(String value) => jsProxy['uri'] = value;

  PrinterSource get source => _createPrinterSource(jsProxy['source']);
  set source(PrinterSource value) => jsProxy['source'] = jsify(value);
}

/**
 * Print job information.
 */
class PrintJobInfo extends ChromeObject {
  PrintJobInfo({String? id, String? title, PrintJobSource? source, String? sourceId, PrintJobStatus? status, num? creationTime, num? completionTime, Printer? printer, PrintSettings? settings, int? numberOfPages, printing.PrinterStatus? printer_status}) {
    if (id != null) this.id = id;
    if (title != null) this.title = title;
    if (source != null) this.source = source;
    if (sourceId != null) this.sourceId = sourceId;
    if (status != null) this.status = status;
    if (creationTime != null) this.creationTime = creationTime;
    if (completionTime != null) this.completionTime = completionTime;
    if (printer != null) this.printer = printer;
    if (settings != null) this.settings = settings;
    if (numberOfPages != null) this.numberOfPages = numberOfPages;
    if (printer_status != null) this.printer_status = printer_status;
  }
  PrintJobInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  PrintJobSource get source => _createPrintJobSource(jsProxy['source']);
  set source(PrintJobSource value) => jsProxy['source'] = jsify(value);

  String get sourceId => jsProxy['sourceId'];
  set sourceId(String value) => jsProxy['sourceId'] = value;

  PrintJobStatus get status => _createPrintJobStatus(jsProxy['status']);
  set status(PrintJobStatus value) => jsProxy['status'] = jsify(value);

  num get creationTime => jsProxy['creationTime'];
  set creationTime(num value) => jsProxy['creationTime'] = jsify(value);

  num get completionTime => jsProxy['completionTime'];
  set completionTime(num value) => jsProxy['completionTime'] = jsify(value);

  Printer get printer => _createPrinter(jsProxy['printer']);
  set printer(Printer value) => jsProxy['printer'] = jsify(value);

  PrintSettings get settings => _createPrintSettings(jsProxy['settings']);
  set settings(PrintSettings value) => jsProxy['settings'] = jsify(value);

  int get numberOfPages => jsProxy['numberOfPages'];
  set numberOfPages(int value) => jsProxy['numberOfPages'] = value;

  printing.PrinterStatus get printer_status => _createprinting.PrinterStatus(jsProxy['printer_status']);
  set printer_status(printing.PrinterStatus value) => jsProxy['printer_status'] = jsify(value);
}

PrintJobInfo _createPrintJobInfo(JsObject jsProxy) => PrintJobInfo.fromProxy(jsProxy);
ColorMode _createColorMode(String value) => ColorMode.VALUES.singleWhere((ChromeEnum e) => e.value == value);
DuplexMode _createDuplexMode(String value) => DuplexMode.VALUES.singleWhere((ChromeEnum e) => e.value == value);
MediaSize _createMediaSize(JsObject jsProxy) => MediaSize.fromProxy(jsProxy);
PrinterSource _createPrinterSource(String value) => PrinterSource.VALUES.singleWhere((ChromeEnum e) => e.value == value);
PrintJobSource _createPrintJobSource(String value) => PrintJobSource.VALUES.singleWhere((ChromeEnum e) => e.value == value);
PrintJobStatus _createPrintJobStatus(String value) => PrintJobStatus.VALUES.singleWhere((ChromeEnum e) => e.value == value);
Printer _createPrinter(JsObject jsProxy) => Printer.fromProxy(jsProxy);
PrintSettings _createPrintSettings(JsObject jsProxy) => PrintSettings.fromProxy(jsProxy);
printing.PrinterStatus _createprinting.PrinterStatus(JsObject jsProxy) => printing.PrinterStatus.fromProxy(jsProxy);

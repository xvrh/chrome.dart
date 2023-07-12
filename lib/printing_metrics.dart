import 'src/internal_helpers.dart';
import 'printing.dart';
import 'src/js/printing_metrics.dart' as $js;
export 'chrome.dart';

final _printingMetrics = ChromePrintingMetrics._();

extension ChromePrintingMetricsExtension on Chrome {
  ChromePrintingMetrics get printingMetrics => _printingMetrics;
}

class ChromePrintingMetrics {
  ChromePrintingMetrics._();

  /// Returns the list of the finished print jobs.
  Future<List<PrintJobInfo>> getPrintJobs() => throw UnimplementedError();

  /// Event fired when the print job is finished.
  /// This includes any of termination statuses: FAILED, CANCELED and PRINTED.
  Stream<PrintJobInfo> get onPrintJobFinished => throw UnimplementedError();
}

/// The source of the print job.
enum PrintJobSource {
  /// The job was created from the Print Preview page initiated by the user.
  printPreview('PRINT_PREVIEW'),

  /// The job was created from an Android App.
  androidApp('ANDROID_APP'),

  /// The job was created by extension via Chrome API.
  extension('EXTENSION');

  const PrintJobSource(this.value);

  final String value;

  String get toJS => value;
  static PrintJobSource fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The final status of the print job.
enum PrintJobStatus {
  /// Print job was interrupted due to some error.
  failed('FAILED'),

  /// Print job was canceled by the user or via API.
  canceled('CANCELED'),

  /// Print job was printed without any errors.
  printed('PRINTED');

  const PrintJobStatus(this.value);

  final String value;

  String get toJS => value;
  static PrintJobStatus fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The source of the printer.
enum PrinterSource {
  /// Printer was added by user.
  user('USER'),

  /// Printer was added via policy.
  policy('POLICY');

  const PrinterSource(this.value);

  final String value;

  String get toJS => value;
  static PrinterSource fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum ColorMode {
  /// Black and white mode was used.
  blackAndWhite('BLACK_AND_WHITE'),

  /// Color mode was used.
  color('COLOR');

  const ColorMode(this.value);

  final String value;

  String get toJS => value;
  static ColorMode fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum DuplexMode {
  /// One-sided printing was used.
  oneSided('ONE_SIDED'),

  /// Two-sided printing was used, flipping on long edge.
  twoSidedLongEdge('TWO_SIDED_LONG_EDGE'),

  /// Two-sided printing was used, flipping on short edge.
  twoSidedShortEdge('TWO_SIDED_SHORT_EDGE');

  const DuplexMode(this.value);

  final String value;

  String get toJS => value;
  static DuplexMode fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class MediaSize {
  MediaSize.fromJS(this._wrapped);

  final $js.MediaSize _wrapped;

  $js.MediaSize get toJS => _wrapped;

  /// Width (in micrometers) of the media used for printing.
  int get width => _wrapped.width;
  set width(int v) {
    throw UnimplementedError();
  }

  /// Height (in micrometers) of the media used for printing.
  int get height => _wrapped.height;
  set height(int v) {
    throw UnimplementedError();
  }

  /// Vendor-provided ID, e.g. "iso_a3_297x420mm" or "na_index-3x5_3x5in".
  /// Possible values are values of "media" IPP attribute and can be found on
  /// <a
  /// href="https://www.iana.org/assignments/ipp-registrations/ipp-registrations.xhtml">
  /// IANA page</a> .
  String get vendorId => _wrapped.vendorId;
  set vendorId(String v) {
    throw UnimplementedError();
  }
}

class PrintSettings {
  PrintSettings.fromJS(this._wrapped);

  final $js.PrintSettings _wrapped;

  $js.PrintSettings get toJS => _wrapped;

  /// The requested color mode.
  ColorMode get color => ColorMode.fromJS(_wrapped.color);
  set color(ColorMode v) {
    throw UnimplementedError();
  }

  /// The requested duplex mode.
  DuplexMode get duplex => DuplexMode.fromJS(_wrapped.duplex);
  set duplex(DuplexMode v) {
    throw UnimplementedError();
  }

  /// The requested media size.
  MediaSize get mediaSize => MediaSize.fromJS(_wrapped.mediaSize);
  set mediaSize(MediaSize v) {
    throw UnimplementedError();
  }

  /// The requested number of copies.
  int get copies => _wrapped.copies;
  set copies(int v) {
    throw UnimplementedError();
  }
}

class Printer {
  Printer.fromJS(this._wrapped);

  final $js.Printer _wrapped;

  $js.Printer get toJS => _wrapped;

  /// Displayed name of the printer.
  String get name => _wrapped.name;
  set name(String v) {
    throw UnimplementedError();
  }

  /// The full path for the printer.
  /// Contains protocol, hostname, port, and queue.
  String get uri => _wrapped.uri;
  set uri(String v) {
    throw UnimplementedError();
  }

  /// The source of the printer.
  PrinterSource get source => PrinterSource.fromJS(_wrapped.source);
  set source(PrinterSource v) {
    throw UnimplementedError();
  }
}

class PrintJobInfo {
  PrintJobInfo.fromJS(this._wrapped);

  final $js.PrintJobInfo _wrapped;

  $js.PrintJobInfo get toJS => _wrapped;

  /// The ID of the job.
  String get id => _wrapped.id;
  set id(String v) {
    throw UnimplementedError();
  }

  /// The title of the document which was printed.
  String get title => _wrapped.title;
  set title(String v) {
    throw UnimplementedError();
  }

  /// Source showing who initiated the print job.
  PrintJobSource get source => PrintJobSource.fromJS(_wrapped.source);
  set source(PrintJobSource v) {
    throw UnimplementedError();
  }

  /// ID of source. Null if source is PRINT_PREVIEW or ANDROID_APP.
  String? get sourceId => _wrapped.sourceId;
  set sourceId(String? v) {
    throw UnimplementedError();
  }

  /// The final status of the job.
  PrintJobStatus get status => PrintJobStatus.fromJS(_wrapped.status);
  set status(PrintJobStatus v) {
    throw UnimplementedError();
  }

  /// The job creation time (in milliseconds past the Unix epoch).
  double get creationTime => _wrapped.creationTime;
  set creationTime(double v) {
    throw UnimplementedError();
  }

  /// The job completion time (in milliseconds past the Unix epoch).
  double get completionTime => _wrapped.completionTime;
  set completionTime(double v) {
    throw UnimplementedError();
  }

  /// The info about the printer which printed the document.
  Printer get printer => Printer.fromJS(_wrapped.printer);
  set printer(Printer v) {
    throw UnimplementedError();
  }

  /// The settings of the print job.
  PrintSettings get settings => PrintSettings.fromJS(_wrapped.settings);
  set settings(PrintSettings v) {
    throw UnimplementedError();
  }

  /// The number of pages in the document.
  int get numberOfPages => _wrapped.numberOfPages;
  set numberOfPages(int v) {
    throw UnimplementedError();
  }

  /// The status of the printer.
  PrinterStatus get printer_status =>
      PrinterStatus.fromJS(_wrapped.printer_status);
  set printer_status(PrinterStatus v) {
    throw UnimplementedError();
  }
}

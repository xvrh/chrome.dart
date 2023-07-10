import 'chrome.dart';
export 'chrome.dart';

final _printingMetrics = ChromePrintingMetrics._();

extension ChromeChromePrintingMetricsExtension on Chrome {
  ChromePrintingMetrics get printingMetrics => _printingMetrics;
}

class ChromePrintingMetrics {
  ChromePrintingMetrics._();

  /// Returns the list of the finished print jobs.
  void getPrintJobs() => throw UnimplementedError();

  /// Event fired when the print job is finished.
  /// This includes any of termination statuses: FAILED, CANCELED and PRINTED.
  Stream get onPrintJobFinished => throw UnimplementedError();
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
}

/// The source of the printer.
enum PrinterSource {
  /// Printer was added by user.
  user('USER'),

  /// Printer was added via policy.
  policy('POLICY');

  const PrinterSource(this.value);

  final String value;
}

enum ColorMode {
  /// Black and white mode was used.
  blackAndWhite('BLACK_AND_WHITE'),

  /// Color mode was used.
  color('COLOR');

  const ColorMode(this.value);

  final String value;
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
}

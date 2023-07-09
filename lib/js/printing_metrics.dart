import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSPrintingMetricsExtension on JSChrome {
  ///  Use the `chrome.printingMetrics` API to fetch data about
  ///  printing usage.
  external JSPrintingMetrics get PrintingMetrics;
}

@JS()
@staticInterop
class JSPrintingMetrics {}

extension JSPrintingMetricsExtension on JSPrintingMetrics {
  ///  Returns the list of the finished print jobs.
  external void getPrintJobs();

  ///  Event fired when the print job is finished.
  ///  This includes any of termination statuses: FAILED, CANCELED and PRINTED.
  external ChromeEvent get onPrintJobFinished;
}

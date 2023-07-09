import 'chrome.dart';

final _PrintingMetrics = ChromePrintingMetrics._();

extension ChromeChromePrintingMetricsExtension on Chrome {
  ChromePrintingMetrics get PrintingMetrics => _PrintingMetrics;
}

class ChromePrintingMetrics {
  ChromePrintingMetrics._();
}

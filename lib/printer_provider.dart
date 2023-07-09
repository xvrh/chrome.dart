import 'chrome.dart';

final _PrinterProvider = ChromePrinterProvider._();

extension ChromeChromePrinterProviderExtension on Chrome {
  ChromePrinterProvider get PrinterProvider => _PrinterProvider;
}

class ChromePrinterProvider {
  ChromePrinterProvider._();
}

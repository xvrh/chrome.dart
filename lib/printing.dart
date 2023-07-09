import 'chrome.dart';

final _Printing = ChromePrinting._();

extension ChromeChromePrintingExtension on Chrome {
  ChromePrinting get Printing => _Printing;
}

class ChromePrinting {
  ChromePrinting._();
}

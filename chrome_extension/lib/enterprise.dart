import 'src/internal_helpers.dart';

export 'enterprise_device_attributes.dart';
export 'enterprise_hardware_platform.dart';
export 'enterprise_networking_attributes.dart';
export 'enterprise_platform_keys.dart';

final _chromeEnterprise = ChromeEnterprise._();

extension ChromeEnterpriseExtension on Chrome {
  ChromeEnterprise get enterprise => _chromeEnterprise;
}

class ChromeEnterprise {
  ChromeEnterprise._();
}

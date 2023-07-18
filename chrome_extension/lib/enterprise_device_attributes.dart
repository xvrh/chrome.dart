import 'dart:js_util';

import 'enterprise.dart';
import 'src/internal_helpers.dart';
import 'src/js/enterprise_device_attributes.dart' as $js;

export 'enterprise.dart' show ChromeEnterprise, ChromeEnterpriseExtension;
export 'src/chrome.dart' show chrome;

final _enterpriseDeviceAttributes = ChromeEnterpriseDeviceAttributes._();

extension ChromeEnterpriseDeviceAttributesExtension on ChromeEnterprise {
  ChromeEnterpriseDeviceAttributes get deviceAttributes =>
      _enterpriseDeviceAttributes;
}

class ChromeEnterpriseDeviceAttributes {
  ChromeEnterpriseDeviceAttributes._();

  /// Fetches the value of
  /// [the device identifier of the directory
  /// API](https://developers.google.com/admin-sdk/directory/v1/guides/manage-chrome-devices),
  /// that is generated by the server and identifies the cloud record of the
  /// device for querying in the cloud directory API.
  /// If the current user is not affiliated, returns an empty string.
  /// |callback| : Called with the device identifier of the directory API when
  /// received.
  Future<String> getDirectoryDeviceId() async {
    var $res = await promiseToFuture<String>(
        $js.chrome.enterprise.deviceAttributes.getDirectoryDeviceId());
    return $res;
  }

  /// Fetches the device's serial number. Please note the purpose of this API
  /// is to administrate the device (e.g. generating Certificate Sign Requests
  /// for device-wide certificates). This API may not be used for tracking
  /// devices without the consent of the device's administrator.
  /// If the current user is not affiliated, returns an empty string.
  /// |callback| : Called with the serial number of the device.
  Future<String> getDeviceSerialNumber() async {
    var $res = await promiseToFuture<String>(
        $js.chrome.enterprise.deviceAttributes.getDeviceSerialNumber());
    return $res;
  }

  /// Fetches the administrator-annotated Asset Id.
  /// If the current user is not affiliated or no Asset Id has been set by the
  /// administrator, returns an empty string.
  /// |callback| : Called with the Asset ID of the device.
  Future<String> getDeviceAssetId() async {
    var $res = await promiseToFuture<String>(
        $js.chrome.enterprise.deviceAttributes.getDeviceAssetId());
    return $res;
  }

  /// Fetches the administrator-annotated Location.
  /// If the current user is not affiliated or no Annotated Location has been
  /// set by the administrator, returns an empty string.
  /// |callback| : Called with the Annotated Location of the device.
  Future<String> getDeviceAnnotatedLocation() async {
    var $res = await promiseToFuture<String>(
        $js.chrome.enterprise.deviceAttributes.getDeviceAnnotatedLocation());
    return $res;
  }

  /// Fetches the device's hostname as set by DeviceHostnameTemplate policy.
  /// If the current user is not affiliated or no hostname has been set by the
  /// enterprise policy, returns an empty string.
  /// |callback| : Called with hostname of the device.
  Future<String> getDeviceHostname() async {
    var $res = await promiseToFuture<String>(
        $js.chrome.enterprise.deviceAttributes.getDeviceHostname());
    return $res;
  }
}

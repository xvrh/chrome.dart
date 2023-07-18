import 'dart:js_interop';

import 'enterprise.dart';

export 'chrome.dart';
export 'enterprise.dart';

extension JSChromeJSEnterpriseDeviceAttributesExtension on JSChromeEnterprise {
  /// Use the `chrome.enterprise.deviceAttributes` API to read device
  /// attributes.
  /// Note: This API is only available to extensions force-installed by
  /// enterprise
  /// policy.
  external JSEnterpriseDeviceAttributes get deviceAttributes;
}

@JS()
@staticInterop
class JSEnterpriseDeviceAttributes {}

extension JSEnterpriseDeviceAttributesExtension
    on JSEnterpriseDeviceAttributes {
  /// Fetches the value of
  /// [the device identifier of the directory
  /// API](https://developers.google.com/admin-sdk/directory/v1/guides/manage-chrome-devices),
  /// that is generated by the server and identifies the cloud record of the
  /// device for querying in the cloud directory API.
  /// If the current user is not affiliated, returns an empty string.
  /// |callback| : Called with the device identifier of the directory API when
  /// received.
  external JSPromise getDirectoryDeviceId();

  /// Fetches the device's serial number. Please note the purpose of this API
  /// is to administrate the device (e.g. generating Certificate Sign Requests
  /// for device-wide certificates). This API may not be used for tracking
  /// devices without the consent of the device's administrator.
  /// If the current user is not affiliated, returns an empty string.
  /// |callback| : Called with the serial number of the device.
  external JSPromise getDeviceSerialNumber();

  /// Fetches the administrator-annotated Asset Id.
  /// If the current user is not affiliated or no Asset Id has been set by the
  /// administrator, returns an empty string.
  /// |callback| : Called with the Asset ID of the device.
  external JSPromise getDeviceAssetId();

  /// Fetches the administrator-annotated Location.
  /// If the current user is not affiliated or no Annotated Location has been
  /// set by the administrator, returns an empty string.
  /// |callback| : Called with the Annotated Location of the device.
  external JSPromise getDeviceAnnotatedLocation();

  /// Fetches the device's hostname as set by DeviceHostnameTemplate policy.
  /// If the current user is not affiliated or no hostname has been set by the
  /// enterprise policy, returns an empty string.
  /// |callback| : Called with hostname of the device.
  external JSPromise getDeviceHostname();
}

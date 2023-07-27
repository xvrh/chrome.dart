import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/types.dart' as $js;

export 'src/chrome.dart' show chrome;

final _types = ChromeTypes._();

extension ChromeTypesExtension on Chrome {
  /// The `chrome.types` API contains type declarations for Chrome.
  ChromeTypes get types => _types;
}

class ChromeTypes {
  ChromeTypes._();

  bool get isAvailable => $js.chrome.typesNullable != null;
}

/// The scope of the ChromeSetting. One of<ul><li>[regular]: setting for the
/// regular profile (which is inherited by the incognito profile if not
/// overridden elsewhere),</li><li>[regular_only]: setting for the regular
/// profile only (not inherited by the incognito
/// profile),</li><li>[incognito_persistent]: setting for the incognito profile
/// that survives browser restarts (overrides regular
/// preferences),</li><li>[incognito_session_only]: setting for the incognito
/// profile that can only be set during an incognito session and is deleted when
/// the incognito session ends (overrides regular and incognito_persistent
/// preferences).</li></ul>
enum ChromeSettingScope {
  regular('regular'),
  regularOnly('regular_only'),
  incognitoPersistent('incognito_persistent'),
  incognitoSessionOnly('incognito_session_only');

  const ChromeSettingScope(this.value);

  final String value;

  String get toJS => value;
  static ChromeSettingScope fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// One of<ul><li>[not_controllable]: cannot be controlled by any
/// extension</li><li>[controlled_by_other_extensions]: controlled by extensions
/// with higher precedence</li><li>[controllable_by_this_extension]: can be
/// controlled by this extension</li><li>[controlled_by_this_extension]:
/// controlled by this extension</li></ul>
enum LevelOfControl {
  notControllable('not_controllable'),
  controlledByOtherExtensions('controlled_by_other_extensions'),
  controllableByThisExtension('controllable_by_this_extension'),
  controlledByThisExtension('controlled_by_this_extension');

  const LevelOfControl(this.value);

  final String value;

  String get toJS => value;
  static LevelOfControl fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class ChromeSetting {
  ChromeSetting.fromJS(this._wrapped);

  ChromeSetting() : _wrapped = $js.ChromeSetting();

  final $js.ChromeSetting _wrapped;

  $js.ChromeSetting get toJS => _wrapped;

  /// Gets the value of a setting.
  /// [details] Which setting to consider.
  Future<GetCallbackDetails> get(GetDetails details) async {
    var $res = await promiseToFuture<$js.GetCallbackDetails>(
        _wrapped.get(details.toJS));
    return GetCallbackDetails.fromJS($res);
  }

  /// Sets the value of a setting.
  /// [details] Which setting to change.
  Future<void> set(SetDetails details) async {
    await promiseToFuture<void>(_wrapped.set(details.toJS));
  }

  /// Clears the setting, restoring any default value.
  /// [details] Which setting to clear.
  Future<void> clear(ClearDetails details) async {
    await promiseToFuture<void>(_wrapped.clear(details.toJS));
  }

  /// Fired after the setting changes.
  Stream<OnChangeDetails> get onChange =>
      _wrapped.onChange.asStream(($c) => ($js.OnChangeDetails details) {
            $c.add(OnChangeDetails.fromJS(details));
          }.toJS);
}

class GetCallbackDetails {
  GetCallbackDetails.fromJS(this._wrapped);

  GetCallbackDetails({
    required Object value,
    required LevelOfControl levelOfControl,
    bool? incognitoSpecific,
  }) : _wrapped = $js.GetCallbackDetails()
          ..value = value.toJS
          ..levelOfControl = levelOfControl.toJS
          ..incognitoSpecific = incognitoSpecific;

  final $js.GetCallbackDetails _wrapped;

  $js.GetCallbackDetails get toJS => _wrapped;

  /// The value of the setting.
  Object get value => _wrapped.value;
  set value(Object v) {
    _wrapped.value = v.toJS;
  }

  /// The level of control of the setting.
  LevelOfControl get levelOfControl =>
      LevelOfControl.fromJS(_wrapped.levelOfControl);
  set levelOfControl(LevelOfControl v) {
    _wrapped.levelOfControl = v.toJS;
  }

  /// Whether the effective value is specific to the incognito session.<br/>This
  /// property will _only_ be present if the [incognito] property in the
  /// [details] parameter of `get()` was true.
  bool? get incognitoSpecific => _wrapped.incognitoSpecific;
  set incognitoSpecific(bool? v) {
    _wrapped.incognitoSpecific = v;
  }
}

class GetDetails {
  GetDetails.fromJS(this._wrapped);

  GetDetails({bool? incognito})
      : _wrapped = $js.GetDetails(incognito: incognito);

  final $js.GetDetails _wrapped;

  $js.GetDetails get toJS => _wrapped;
}

class SetDetails {
  SetDetails.fromJS(this._wrapped);

  SetDetails({
    required Object value,
    ChromeSettingScope? scope,
  }) : _wrapped = $js.SetDetails(
          value: value.toJS,
          scope: scope?.toJS,
        );

  final $js.SetDetails _wrapped;

  $js.SetDetails get toJS => _wrapped;
}

class ClearDetails {
  ClearDetails.fromJS(this._wrapped);

  ClearDetails({ChromeSettingScope? scope})
      : _wrapped = $js.ClearDetails(scope: scope?.toJS);

  final $js.ClearDetails _wrapped;

  $js.ClearDetails get toJS => _wrapped;
}

class OnChangeDetails {
  OnChangeDetails.fromJS(this._wrapped);

  OnChangeDetails({
    required Object value,
    required LevelOfControl levelOfControl,
    bool? incognitoSpecific,
  }) : _wrapped = $js.OnChangeDetails()
          ..value = value.toJS
          ..levelOfControl = levelOfControl.toJS
          ..incognitoSpecific = incognitoSpecific;

  final $js.OnChangeDetails _wrapped;

  $js.OnChangeDetails get toJS => _wrapped;

  /// The value of the setting after the change.
  Object get value => _wrapped.value;
  set value(Object v) {
    _wrapped.value = v.toJS;
  }

  /// The level of control of the setting.
  LevelOfControl get levelOfControl =>
      LevelOfControl.fromJS(_wrapped.levelOfControl);
  set levelOfControl(LevelOfControl v) {
    _wrapped.levelOfControl = v.toJS;
  }

  /// Whether the value that has changed is specific to the incognito
  /// session.<br/>This property will _only_ be present if the user has enabled
  /// the extension in incognito mode.
  bool? get incognitoSpecific => _wrapped.incognitoSpecific;
  set incognitoSpecific(bool? v) {
    _wrapped.incognitoSpecific = v;
  }
}

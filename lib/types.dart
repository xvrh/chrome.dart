import 'src/internal_helpers.dart';
import 'src/js/types.dart' as $js;

export 'src/chrome.dart' show chrome;

final _types = ChromeTypes._();

extension ChromeTypesExtension on Chrome {
  ChromeTypes get types => _types;
}

class ChromeTypes {
  ChromeTypes._();
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
  Future<GetCallbackDetails> get(GetDetails details) {
    var $completer = Completer<GetCallbackDetails>();
    _wrapped.get(
      details.toJS,
      ($js.GetCallbackDetails details) {
        $completer.complete(GetCallbackDetails.fromJS(details));
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the value of a setting.
  Future<void> set(SetDetails details) {
    var $completer = Completer<void>();
    _wrapped.set(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears the setting, restoring any default value.
  Future<void> clear(ClearDetails details) {
    var $completer = Completer<void>();
    _wrapped.clear(
      details.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Fired after the setting changes.
  Stream<OnChangeDetails> get onChange => throw UnimplementedError();
}

class GetCallbackDetails {
  GetCallbackDetails.fromJS(this._wrapped);

  GetCallbackDetails({
    required JSAny value,
    required LevelOfControl levelOfControl,
    bool? incognitoSpecific,
  }) : _wrapped = $js.GetCallbackDetails()
          ..value = value
          ..levelOfControl = levelOfControl.toJS
          ..incognitoSpecific = incognitoSpecific;

  final $js.GetCallbackDetails _wrapped;

  $js.GetCallbackDetails get toJS => _wrapped;

  /// The value of the setting.
  JSAny get value => _wrapped.value;
  set value(JSAny v) {
    _wrapped.value = v;
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
    required JSAny value,
    ChromeSettingScope? scope,
  }) : _wrapped = $js.SetDetails(
          value: value,
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
    required JSAny value,
    required LevelOfControl levelOfControl,
    bool? incognitoSpecific,
  }) : _wrapped = $js.OnChangeDetails()
          ..value = value
          ..levelOfControl = levelOfControl.toJS
          ..incognitoSpecific = incognitoSpecific;

  final $js.OnChangeDetails _wrapped;

  $js.OnChangeDetails get toJS => _wrapped;

  /// The value of the setting after the change.
  JSAny get value => _wrapped.value;
  set value(JSAny v) {
    _wrapped.value = v;
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

import 'chrome.dart';
export 'chrome.dart';

final _types = ChromeTypes._();

extension ChromeChromeTypesExtension on Chrome {
  ChromeTypes get types => _types;
}

class ChromeTypes {
  ChromeTypes._();
}

/// The scope of the ChromeSetting. One of<ul><li><var>regular</var>: setting
/// for the regular profile (which is inherited by the incognito profile if not
/// overridden elsewhere),</li><li><var>regular_only</var>: setting for the
/// regular profile only (not inherited by the incognito
/// profile),</li><li><var>incognito_persistent</var>: setting for the incognito
/// profile that survives browser restarts (overrides regular
/// preferences),</li><li><var>incognito_session_only</var>: setting for the
/// incognito profile that can only be set during an incognito session and is
/// deleted when the incognito session ends (overrides regular and
/// incognito_persistent preferences).</li></ul>
enum ChromeSettingScope {
  regular('regular'),
  regularOnly('regular_only'),
  incognitoPersistent('incognito_persistent'),
  incognitoSessionOnly('incognito_session_only');

  const ChromeSettingScope(this.value);

  final String value;
}

/// One of<ul><li><var>not_controllable</var>: cannot be controlled by any
/// extension</li><li><var>controlled_by_other_extensions</var>: controlled by
/// extensions with higher
/// precedence</li><li><var>controllable_by_this_extension</var>: can be
/// controlled by this
/// extension</li><li><var>controlled_by_this_extension</var>: controlled by
/// this extension</li></ul>
enum LevelOfControl {
  notControllable('not_controllable'),
  controlledByOtherExtensions('controlled_by_other_extensions'),
  controllableByThisExtension('controllable_by_this_extension'),
  controlledByThisExtension('controlled_by_this_extension');

  const LevelOfControl(this.value);

  final String value;
}

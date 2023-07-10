import 'chrome.dart';
export 'chrome.dart';

final _types = ChromeTypes._();

extension ChromeChromeTypesExtension on Chrome {
  ChromeTypes get types => _types;
}

class ChromeTypes {
  ChromeTypes._();
}

/// The scope of the ChromeSetting. One of<ul><li>`regular`: setting for the
/// regular profile (which is inherited by the incognito profile if not
/// overridden elsewhere),</li><li>`regular_only`: setting for the regular
/// profile only (not inherited by the incognito
/// profile),</li><li>`incognito_persistent`: setting for the incognito profile
/// that survives browser restarts (overrides regular
/// preferences),</li><li>`incognito_session_only`: setting for the incognito
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
}

/// One of<ul><li>`not_controllable`: cannot be controlled by any
/// extension</li><li>`controlled_by_other_extensions`: controlled by extensions
/// with higher precedence</li><li>`controllable_by_this_extension`: can be
/// controlled by this extension</li><li>`controlled_by_this_extension`:
/// controlled by this extension</li></ul>
enum LevelOfControl {
  notControllable('not_controllable'),
  controlledByOtherExtensions('controlled_by_other_extensions'),
  controllableByThisExtension('controllable_by_this_extension'),
  controlledByThisExtension('controlled_by_this_extension');

  const LevelOfControl(this.value);

  final String value;
}

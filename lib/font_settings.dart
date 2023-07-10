import 'chrome.dart';
export 'chrome.dart';

final _fontSettings = ChromeFontSettings._();

extension ChromeFontSettingsExtension on Chrome {
  ChromeFontSettings get fontSettings => _fontSettings;
}

class ChromeFontSettings {
  ChromeFontSettings._();

  /// Clears the font set by this extension, if any.
  void clearFont(details) => throw UnimplementedError();

  /// Gets the font for a given script and generic font family.
  void getFont(details) => throw UnimplementedError();

  /// Sets the font for a given script and generic font family.
  void setFont(details) => throw UnimplementedError();

  /// Gets a list of fonts on the system.
  void getFontList() => throw UnimplementedError();

  /// Clears the default font size set by this extension, if any.
  void clearDefaultFontSize(details) => throw UnimplementedError();

  /// Gets the default font size.
  void getDefaultFontSize(details) => throw UnimplementedError();

  /// Sets the default font size.
  void setDefaultFontSize(details) => throw UnimplementedError();

  /// Clears the default fixed font size set by this extension, if any.
  void clearDefaultFixedFontSize(details) => throw UnimplementedError();

  /// Gets the default size for fixed width fonts.
  void getDefaultFixedFontSize(details) => throw UnimplementedError();

  /// Sets the default size for fixed width fonts.
  void setDefaultFixedFontSize(details) => throw UnimplementedError();

  /// Clears the minimum font size set by this extension, if any.
  void clearMinimumFontSize(details) => throw UnimplementedError();

  /// Gets the minimum font size.
  void getMinimumFontSize(details) => throw UnimplementedError();

  /// Sets the minimum font size.
  void setMinimumFontSize(details) => throw UnimplementedError();

  /// Fired when a font setting changes.
  Stream get onFontChanged => throw UnimplementedError();

  /// Fired when the default font size setting changes.
  Stream get onDefaultFontSizeChanged => throw UnimplementedError();

  /// Fired when the default fixed font size setting changes.
  Stream get onDefaultFixedFontSizeChanged => throw UnimplementedError();

  /// Fired when the minimum font size setting changes.
  Stream get onMinimumFontSizeChanged => throw UnimplementedError();
}

/// An ISO 15924 script code. The default, or global, script is represented by
/// script code "Zyyy".
enum ScriptCode {
  afak('Afak'),
  arab('Arab'),
  armi('Armi'),
  armn('Armn'),
  avst('Avst'),
  bali('Bali'),
  bamu('Bamu'),
  bass('Bass'),
  batk('Batk'),
  beng('Beng'),
  blis('Blis'),
  bopo('Bopo'),
  brah('Brah'),
  brai('Brai'),
  bugi('Bugi'),
  buhd('Buhd'),
  cakm('Cakm'),
  cans('Cans'),
  cari('Cari'),
  cham('Cham'),
  cher('Cher'),
  cirt('Cirt'),
  copt('Copt'),
  cprt('Cprt'),
  cyrl('Cyrl'),
  cyrs('Cyrs'),
  deva('Deva'),
  dsrt('Dsrt'),
  dupl('Dupl'),
  egyd('Egyd'),
  egyh('Egyh'),
  egyp('Egyp'),
  elba('Elba'),
  ethi('Ethi'),
  geor('Geor'),
  geok('Geok'),
  glag('Glag'),
  goth('Goth'),
  gran('Gran'),
  grek('Grek'),
  gujr('Gujr'),
  guru('Guru'),
  hang('Hang'),
  hani('Hani'),
  hano('Hano'),
  hans('Hans'),
  hant('Hant'),
  hebr('Hebr'),
  hluw('Hluw'),
  hmng('Hmng'),
  hung('Hung'),
  inds('Inds'),
  ital('Ital'),
  java('Java'),
  jpan('Jpan'),
  jurc('Jurc'),
  kali('Kali'),
  khar('Khar'),
  khmr('Khmr'),
  khoj('Khoj'),
  knda('Knda'),
  kpel('Kpel'),
  kthi('Kthi'),
  lana('Lana'),
  laoo('Laoo'),
  latf('Latf'),
  latg('Latg'),
  latn('Latn'),
  lepc('Lepc'),
  limb('Limb'),
  lina('Lina'),
  linb('Linb'),
  lisu('Lisu'),
  loma('Loma'),
  lyci('Lyci'),
  lydi('Lydi'),
  mand('Mand'),
  mani('Mani'),
  maya('Maya'),
  mend('Mend'),
  merc('Merc'),
  mero('Mero'),
  mlym('Mlym'),
  moon('Moon'),
  mong('Mong'),
  mroo('Mroo'),
  mtei('Mtei'),
  mymr('Mymr'),
  narb('Narb'),
  nbat('Nbat'),
  nkgb('Nkgb'),
  nkoo('Nkoo'),
  nshu('Nshu'),
  ogam('Ogam'),
  olck('Olck'),
  orkh('Orkh'),
  orya('Orya'),
  osma('Osma'),
  palm('Palm'),
  perm('Perm'),
  phag('Phag'),
  phli('Phli'),
  phlp('Phlp'),
  phlv('Phlv'),
  phnx('Phnx'),
  plrd('Plrd'),
  prti('Prti'),
  rjng('Rjng'),
  roro('Roro'),
  runr('Runr'),
  samr('Samr'),
  sara('Sara'),
  sarb('Sarb'),
  saur('Saur'),
  sgnw('Sgnw'),
  shaw('Shaw'),
  shrd('Shrd'),
  sind('Sind'),
  sinh('Sinh'),
  sora('Sora'),
  sund('Sund'),
  sylo('Sylo'),
  syrc('Syrc'),
  syre('Syre'),
  syrj('Syrj'),
  syrn('Syrn'),
  tagb('Tagb'),
  takr('Takr'),
  tale('Tale'),
  talu('Talu'),
  taml('Taml'),
  tang('Tang'),
  tavt('Tavt'),
  telu('Telu'),
  teng('Teng'),
  tfng('Tfng'),
  tglg('Tglg'),
  thaa('Thaa'),
  thai('Thai'),
  tibt('Tibt'),
  tirh('Tirh'),
  ugar('Ugar'),
  vaii('Vaii'),
  visp('Visp'),
  wara('Wara'),
  wole('Wole'),
  xpeo('Xpeo'),
  xsux('Xsux'),
  yiii('Yiii'),
  zmth('Zmth'),
  zsym('Zsym'),
  zyyy('Zyyy');

  const ScriptCode(this.value);

  final String value;
}

/// A CSS generic font family.
enum GenericFamily {
  standard('standard'),
  sansserif('sansserif'),
  serif('serif'),
  fixed('fixed'),
  cursive('cursive'),
  fantasy('fantasy'),
  math('math');

  const GenericFamily(this.value);

  final String value;
}

/// One of
/// `not_controllable`: cannot be controlled by any extension
/// `controlled_by_other_extensions`: controlled by extensions with higher
/// precedence
/// `controllable_by_this_extension`: can be controlled by this extension
/// `controlled_by_this_extension`: controlled by this extension
enum LevelOfControl {
  notControllable('not_controllable'),
  controlledByOtherExtensions('controlled_by_other_extensions'),
  controllableByThisExtension('controllable_by_this_extension'),
  controlledByThisExtension('controlled_by_this_extension');

  const LevelOfControl(this.value);

  final String value;
}

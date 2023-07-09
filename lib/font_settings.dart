import 'chrome.dart';
export 'chrome.dart';

final _fontSettings = ChromeFontSettings._();

extension ChromeChromeFontSettingsExtension on Chrome {
  ChromeFontSettings get fontSettings => _fontSettings;
}

class ChromeFontSettings {
  ChromeFontSettings._();
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

/// One of<br><var>not_controllable</var>: cannot be controlled by any
/// extension<br><var>controlled_by_other_extensions</var>: controlled by
/// extensions with higher
/// precedence<br><var>controllable_by_this_extension</var>: can be controlled
/// by this extension<br><var>controlled_by_this_extension</var>: controlled by
/// this extension
enum LevelOfControl {
  notControllable('not_controllable'),
  controlledByOtherExtensions('controlled_by_other_extensions'),
  controllableByThisExtension('controllable_by_this_extension'),
  controlledByThisExtension('controlled_by_this_extension');

  const LevelOfControl(this.value);

  final String value;
}

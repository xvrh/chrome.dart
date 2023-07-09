import 'chrome.dart';
export 'chrome.dart';

final _audio = ChromeAudio._();

extension ChromeChromeAudioExtension on Chrome {
  ChromeAudio get audio => _audio;
}

class ChromeAudio {
  ChromeAudio._();
}

///  Type of stream an audio device provides.
enum StreamType {
  input('INPUT'),
  output('OUTPUT');

  const StreamType(this.value);

  final String value;
}

///  Available audio device types.
enum DeviceType {
  headphone('HEADPHONE'),
  mic('MIC'),
  usb('USB'),
  bluetooth('BLUETOOTH'),
  hdmi('HDMI'),
  internalSPEAKER('INTERNAL_SPEAKER'),
  internalMIC('INTERNAL_MIC'),
  frontMIC('FRONT_MIC'),
  rearMIC('REAR_MIC'),
  keyboardMIC('KEYBOARD_MIC'),
  hotword('HOTWORD'),
  lineout('LINEOUT'),
  postMIXLOOPBACK('POST_MIX_LOOPBACK'),
  postDSPLOOPBACK('POST_DSP_LOOPBACK'),
  alsaLOOPBACK('ALSA_LOOPBACK'),
  other('OTHER');

  const DeviceType(this.value);

  final String value;
}

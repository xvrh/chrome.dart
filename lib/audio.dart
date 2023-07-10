import 'chrome.dart';
export 'chrome.dart';

final _audio = ChromeAudio._();

extension ChromeChromeAudioExtension on Chrome {
  ChromeAudio get audio => _audio;
}

class ChromeAudio {
  ChromeAudio._();

  /// Gets a list of audio devices filtered based on |filter|.
  /// |filter|: Device properties by which to filter the list of returned
  ///     audio devices. If the filter is not set or set to `{}`,
  ///     returned device list will contain all available audio devices.
  /// |callback|: Reports the requested list of audio devices.
  void getDevices(filter) => throw UnimplementedError();

  /// Sets lists of active input and/or output devices.
  /// |ids|: <p>Specifies IDs of devices that should be active. If either the
  ///     input or output list is not set, devices in that category are
  ///     unaffected.
  ///     </p>
  ///     <p>It is an error to pass in a non-existent device ID.</p>
  void setActiveDevices(ids) => throw UnimplementedError();

  /// Sets the properties for the input or output device.
  void setProperties(
    id,
    properties,
  ) =>
      throw UnimplementedError();

  /// Gets the system-wide mute state for the specified stream type.
  /// |streamType|: Stream type for which mute state should be fetched.
  /// |callback|: Callback reporting whether mute is set or not for specified
  /// stream type.
  void getMute(streamType) => throw UnimplementedError();

  /// Sets mute state for a stream type. The mute state will apply to all audio
  /// devices with the specified audio stream type.
  /// |streamType|: Stream type for which mute state should be set.
  /// |isMuted|: New mute value.
  void setMute(
    streamType,
    isMuted,
  ) =>
      throw UnimplementedError();

  /// Fired when sound level changes for an active audio device.
  Stream get onLevelChanged => throw UnimplementedError();

  /// Fired when the mute state of the audio input or output changes.
  /// Note that mute state is system-wide and the new value applies to every
  /// audio device with specified stream type.
  Stream get onMuteChanged => throw UnimplementedError();

  /// Fired when audio devices change, either new devices being added, or
  /// existing devices being removed.
  /// |devices|: List of all present audio devices after the change.
  Stream get onDeviceListChanged => throw UnimplementedError();
}

/// Type of stream an audio device provides.
enum StreamType {
  input('INPUT'),
  output('OUTPUT');

  const StreamType(this.value);

  final String value;
}

/// Available audio device types.
enum DeviceType {
  headphone('HEADPHONE'),
  mic('MIC'),
  usb('USB'),
  bluetooth('BLUETOOTH'),
  hdmi('HDMI'),
  internalSpeaker('INTERNAL_SPEAKER'),
  internalMic('INTERNAL_MIC'),
  frontMic('FRONT_MIC'),
  rearMic('REAR_MIC'),
  keyboardMic('KEYBOARD_MIC'),
  hotword('HOTWORD'),
  lineout('LINEOUT'),
  postMixLoopback('POST_MIX_LOOPBACK'),
  postDspLoopback('POST_DSP_LOOPBACK'),
  alsaLoopback('ALSA_LOOPBACK'),
  other('OTHER');

  const DeviceType(this.value);

  final String value;
}

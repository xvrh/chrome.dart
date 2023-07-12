import 'src/internal_helpers.dart';
import 'src/js/audio.dart' as $js;
export 'chrome.dart';

final _audio = ChromeAudio._();

extension ChromeAudioExtension on Chrome {
  ChromeAudio get audio => _audio;
}

class ChromeAudio {
  ChromeAudio._();

  /// Gets a list of audio devices filtered based on |filter|.
  /// |filter|: Device properties by which to filter the list of returned
  ///     audio devices. If the filter is not set or set to `{}`,
  ///     returned device list will contain all available audio devices.
  /// |callback|: Reports the requested list of audio devices.
  Future<List<AudioDeviceInfo>> getDevices(DeviceFilter? filter) =>
      throw UnimplementedError();

  /// Sets lists of active input and/or output devices.
  /// |ids|: Specifies IDs of devices that should be active. If either the
  ///     input or output list is not set, devices in that category are
  ///     unaffected.
  ///
  ///     It is an error to pass in a non-existent device ID.
  Future<void> setActiveDevices(DeviceIdLists ids) =>
      throw UnimplementedError();

  /// Sets the properties for the input or output device.
  Future<void> setProperties(
    String id,
    DeviceProperties properties,
  ) =>
      throw UnimplementedError();

  /// Gets the system-wide mute state for the specified stream type.
  /// |streamType|: Stream type for which mute state should be fetched.
  /// |callback|: Callback reporting whether mute is set or not for specified
  /// stream type.
  Future<bool> getMute(StreamType streamType) => throw UnimplementedError();

  /// Sets mute state for a stream type. The mute state will apply to all audio
  /// devices with the specified audio stream type.
  /// |streamType|: Stream type for which mute state should be set.
  /// |isMuted|: New mute value.
  Future<void> setMute(
    StreamType streamType,
    bool isMuted,
  ) =>
      throw UnimplementedError();

  /// Fired when sound level changes for an active audio device.
  Stream<LevelChangedEvent> get onLevelChanged => throw UnimplementedError();

  /// Fired when the mute state of the audio input or output changes.
  /// Note that mute state is system-wide and the new value applies to every
  /// audio device with specified stream type.
  Stream<MuteChangedEvent> get onMuteChanged => throw UnimplementedError();

  /// Fired when audio devices change, either new devices being added, or
  /// existing devices being removed.
  /// |devices|: List of all present audio devices after the change.
  Stream<List<AudioDeviceInfo>> get onDeviceListChanged =>
      throw UnimplementedError();
}

/// Type of stream an audio device provides.
enum StreamType {
  input('INPUT'),
  output('OUTPUT');

  const StreamType(this.value);

  final String value;

  String get toJS => value;
  static StreamType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
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

  String get toJS => value;
  static DeviceType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class AudioDeviceInfo {
  AudioDeviceInfo.fromJS(this._wrapped);

  final $js.AudioDeviceInfo _wrapped;

  $js.AudioDeviceInfo get toJS => _wrapped;

  /// The unique identifier of the audio device.
  String get id => _wrapped.id;
  set id(String v) {
    _wrapped.id = v;
  }

  /// Stream type associated with this device.
  StreamType get streamType => StreamType.fromJS(_wrapped.streamType);
  set streamType(StreamType v) {
    _wrapped.streamType = v.toJS;
  }

  /// Type of the device.
  DeviceType get deviceType => DeviceType.fromJS(_wrapped.deviceType);
  set deviceType(DeviceType v) {
    _wrapped.deviceType = v.toJS;
  }

  /// The user-friendly name (e.g. "USB Microphone").
  String get displayName => _wrapped.displayName;
  set displayName(String v) {
    _wrapped.displayName = v;
  }

  /// Device name.
  String get deviceName => _wrapped.deviceName;
  set deviceName(String v) {
    _wrapped.deviceName = v;
  }

  /// True if this is the current active device.
  bool get isActive => _wrapped.isActive;
  set isActive(bool v) {
    _wrapped.isActive = v;
  }

  /// The sound level of the device, volume for output, gain for input.
  int get level => _wrapped.level;
  set level(int v) {
    _wrapped.level = v;
  }

  /// The stable/persisted device id string when available.
  String? get stableDeviceId => _wrapped.stableDeviceId;
  set stableDeviceId(String? v) {
    _wrapped.stableDeviceId = v;
  }
}

class DeviceFilter {
  DeviceFilter.fromJS(this._wrapped);

  final $js.DeviceFilter _wrapped;

  $js.DeviceFilter get toJS => _wrapped;

  /// If set, only audio devices whose stream type is included in this list
  /// will satisfy the filter.
  List<StreamType>? get streamTypes => throw UnimplementedError();
  set streamTypes(List<StreamType>? v) {
    _wrapped.streamTypes = throw UnimplementedError();
  }

  /// If set, only audio devices whose active state matches this value will
  /// satisfy the filter.
  bool? get isActive => _wrapped.isActive;
  set isActive(bool? v) {
    _wrapped.isActive = v;
  }
}

class DeviceProperties {
  DeviceProperties.fromJS(this._wrapped);

  final $js.DeviceProperties _wrapped;

  $js.DeviceProperties get toJS => _wrapped;

  ///
  ///   The audio device's desired sound level. Defaults to the device's
  ///   current sound level.
  ///
  /// If used with audio input device, represents audio device gain.
  /// If used with audio output device, represents audio device volume.
  int? get level => _wrapped.level;
  set level(int? v) {
    _wrapped.level = v;
  }
}

class DeviceIdLists {
  DeviceIdLists.fromJS(this._wrapped);

  final $js.DeviceIdLists _wrapped;

  $js.DeviceIdLists get toJS => _wrapped;

  /// List of input devices specified by their ID.
  /// To indicate input devices should be unaffected, leave this property
  ///   unset.
  List<String>? get input => throw UnimplementedError();
  set input(List<String>? v) {
    _wrapped.input = throw UnimplementedError();
  }

  /// List of output devices specified by their ID.
  /// To indicate output devices should be unaffected, leave this property
  ///   unset.
  List<String>? get output => throw UnimplementedError();
  set output(List<String>? v) {
    _wrapped.output = throw UnimplementedError();
  }
}

class MuteChangedEvent {
  MuteChangedEvent.fromJS(this._wrapped);

  final $js.MuteChangedEvent _wrapped;

  $js.MuteChangedEvent get toJS => _wrapped;

  /// The type of the stream for which the mute value changed. The updated mute
  /// value applies to all devices with this stream type.
  StreamType get streamType => StreamType.fromJS(_wrapped.streamType);
  set streamType(StreamType v) {
    _wrapped.streamType = v.toJS;
  }

  /// Whether or not the stream is now muted.
  bool get isMuted => _wrapped.isMuted;
  set isMuted(bool v) {
    _wrapped.isMuted = v;
  }
}

class LevelChangedEvent {
  LevelChangedEvent.fromJS(this._wrapped);

  final $js.LevelChangedEvent _wrapped;

  $js.LevelChangedEvent get toJS => _wrapped;

  /// ID of device whose sound level has changed.
  String get deviceId => _wrapped.deviceId;
  set deviceId(String v) {
    _wrapped.deviceId = v;
  }

  /// The device's new sound level.
  int get level => _wrapped.level;
  set level(int v) {
    _wrapped.level = v;
  }
}

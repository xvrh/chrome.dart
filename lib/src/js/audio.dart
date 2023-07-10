import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSAudioExtension on JSChrome {
  ///  The `chrome.audio` API is provided to allow users to
  ///  get information about and control the audio devices attached to the
  ///  system.
  ///  This API is currently only available in kiosk mode for ChromeOS.
  external JSAudio get audio;
}

@JS()
@staticInterop
class JSAudio {}

extension JSAudioExtension on JSAudio {
  ///  Gets a list of audio devices filtered based on |filter|.
  ///  |filter|: Device properties by which to filter the list of returned
  ///      audio devices. If the filter is not set or set to `{}`,
  ///      returned device list will contain all available audio devices.
  ///  |callback|: Reports the requested list of audio devices.
  external void getDevices(
    DeviceFilter? filter,
    JSFunction callback,
  );

  ///  Sets lists of active input and/or output devices.
  ///  |ids|: <p>Specifies IDs of devices that should be active. If either the
  ///      input or output list is not set, devices in that category are
  ///      unaffected.
  ///      </p>
  ///      <p>It is an error to pass in a non-existent device ID.</p>
  external void setActiveDevices(
    DeviceIdLists ids,
    JSFunction callback,
  );

  ///  Sets the properties for the input or output device.
  external void setProperties(
    JSString id,
    DeviceProperties properties,
    JSFunction callback,
  );

  ///  Gets the system-wide mute state for the specified stream type.
  ///  |streamType|: Stream type for which mute state should be fetched.
  ///  |callback|: Callback reporting whether mute is set or not for specified
  ///  stream type.
  external void getMute(
    StreamType streamType,
    JSFunction callback,
  );

  ///  Sets mute state for a stream type. The mute state will apply to all audio
  ///  devices with the specified audio stream type.
  ///  |streamType|: Stream type for which mute state should be set.
  ///  |isMuted|: New mute value.
  external void setMute(
    StreamType streamType,
    JSBoolean isMuted,
    JSFunction callback,
  );

  ///  Fired when sound level changes for an active audio device.
  external ChromeEvent get onLevelChanged;

  ///  Fired when the mute state of the audio input or output changes.
  ///  Note that mute state is system-wide and the new value applies to every
  ///  audio device with specified stream type.
  external ChromeEvent get onMuteChanged;

  ///  Fired when audio devices change, either new devices being added, or
  ///  existing devices being removed.
  ///  |devices|: List of all present audio devices after the change.
  external ChromeEvent get onDeviceListChanged;
}

///  Type of stream an audio device provides.
typedef StreamType = JSString;

///  Available audio device types.
typedef DeviceType = JSString;

@JS()
@staticInterop
class AudioDeviceInfo {}

extension AudioDeviceInfoExtension on AudioDeviceInfo {
  ///  The unique identifier of the audio device.
  external JSString get id;

  ///  Stream type associated with this device.
  external StreamType get streamType;

  ///  Type of the device.
  external DeviceType get deviceType;

  ///  The user-friendly name (e.g. "USB Microphone").
  external JSString get displayName;

  ///  Device name.
  external JSString get deviceName;

  ///  True if this is the current active device.
  external JSBoolean get isActive;

  ///  The sound level of the device, volume for output, gain for input.
  external JSNumber get level;

  ///  The stable/persisted device id string when available.
  external JSString? get stableDeviceId;
}

@JS()
@staticInterop
class DeviceFilter {}

extension DeviceFilterExtension on DeviceFilter {
  ///  If set, only audio devices whose stream type is included in this list
  ///  will satisfy the filter.
  external JSArray? get streamTypes;

  ///  If set, only audio devices whose active state matches this value will
  ///  satisfy the filter.
  external JSBoolean? get isActive;
}

@JS()
@staticInterop
class DeviceProperties {}

extension DevicePropertiesExtension on DeviceProperties {
  ///  <p>
  ///    The audio device's desired sound level. Defaults to the device's
  ///    current sound level.
  ///  </p>
  ///  <p>If used with audio input device, represents audio device gain.</p>
  ///  <p>If used with audio output device, represents audio device volume.</p>
  external JSNumber? get level;
}

@JS()
@staticInterop
class DeviceIdLists {}

extension DeviceIdListsExtension on DeviceIdLists {
  ///  <p>List of input devices specified by their ID.</p>
  ///  <p>To indicate input devices should be unaffected, leave this property
  ///    unset.</p>
  external JSArray? get input;

  ///  <p>List of output devices specified by their ID.</p>
  ///  <p>To indicate output devices should be unaffected, leave this property
  ///    unset.</p>
  external JSArray? get output;
}

@JS()
@staticInterop
class MuteChangedEvent {}

extension MuteChangedEventExtension on MuteChangedEvent {
  ///  The type of the stream for which the mute value changed. The updated mute
  ///  value applies to all devices with this stream type.
  external StreamType get streamType;

  ///  Whether or not the stream is now muted.
  external JSBoolean get isMuted;
}

@JS()
@staticInterop
class LevelChangedEvent {}

extension LevelChangedEventExtension on LevelChangedEvent {
  ///  ID of device whose sound level has changed.
  external JSString get deviceId;

  ///  The device's new sound level.
  external JSNumber get level;
}
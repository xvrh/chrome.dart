import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSAudioExtension on JSChrome {
  ///  The `chrome.audio` API is provided to allow users to
  ///  get information about and control the audio devices attached to the
  ///  system.
  ///  This API is currently only available in kiosk mode for ChromeOS.
  external JSAudio get Audio;
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
  external void getDevices();

  ///  Sets lists of active input and/or output devices.
  ///  |ids|: <p>Specifies IDs of devices that should be active. If either the
  ///      input or output list is not set, devices in that category are
  ///      unaffected.
  ///      </p>
  ///      <p>It is an error to pass in a non-existent device ID.</p>
  external void setActiveDevices();

  ///  Sets the properties for the input or output device.
  external void setProperties();

  ///  Gets the system-wide mute state for the specified stream type.
  ///  |streamType|: Stream type for which mute state should be fetched.
  ///  |callback|: Callback reporting whether mute is set or not for specified
  ///  stream type.
  external void getMute();

  ///  Sets mute state for a stream type. The mute state will apply to all audio
  ///  devices with the specified audio stream type.
  ///  |streamType|: Stream type for which mute state should be set.
  ///  |isMuted|: New mute value.
  external void setMute();

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

import 'chrome.dart';
export 'chrome.dart';

final _systemDisplay = ChromeSystemDisplay._();

extension ChromeChromeSystemDisplayExtension on Chrome {
  ChromeSystemDisplay get systemDisplay => _systemDisplay;
}

class ChromeSystemDisplay {
  ChromeSystemDisplay._();

  /// Requests the information for all attached display devices.
  /// |flags|: Options affecting how the information is returned.
  /// |callback|: The callback to invoke with the results.
  void getInfo(flags) => throw UnimplementedError();

  /// Requests the layout info for all displays.
  /// NOTE: This is only available to Chrome OS Kiosk apps and Web UI.
  /// |callback|: The callback to invoke with the results.
  void getDisplayLayout() => throw UnimplementedError();

  /// Updates the properties for the display specified by |id|, according to
  /// the information provided in |info|. On failure, $(ref:runtime.lastError)
  /// will be set.
  /// NOTE: This is only available to Chrome OS Kiosk apps and Web UI.
  /// |id|: The display's unique identifier.
  /// |info|: The information about display properties that should be changed.
  ///     A property will be changed only if a new value for it is specified in
  ///     |info|.
  /// |callback|: Empty function called when the function finishes. To find out
  ///     whether the function succeeded, $(ref:runtime.lastError) should be
  ///     queried.
  void setDisplayProperties(
    id,
    info,
  ) =>
      throw UnimplementedError();

  /// Set the layout for all displays. Any display not included will use the
  /// default layout. If a layout would overlap or be otherwise invalid it
  /// will be adjusted to a valid layout. After layout is resolved, an
  /// onDisplayChanged event will be triggered.
  /// NOTE: This is only available to Chrome OS Kiosk apps and Web UI.
  /// |layouts|: The layout information, required for all displays except
  ///     the primary display.
  /// |callback|: Empty function called when the function finishes. To find out
  ///     whether the function succeeded, $(ref:runtime.lastError) should be
  ///     queried.
  void setDisplayLayout(layouts) => throw UnimplementedError();

  /// Enables/disables the unified desktop feature. If enabled while mirroring
  /// is active, the desktop mode will not change until mirroring is turned
  /// off. Otherwise, the desktop mode will switch to unified immediately.
  /// NOTE: This is only available to Chrome OS Kiosk apps and Web UI.
  /// |enabled|: True if unified desktop should be enabled.
  void enableUnifiedDesktop(enabled) => throw UnimplementedError();

  /// Starts overscan calibration for a display. This will show an overlay
  /// on the screen indicating the current overscan insets. If overscan
  /// calibration for display |id| is in progress this will reset calibration.
  /// |id|: The display's unique identifier.
  void overscanCalibrationStart(id) => throw UnimplementedError();

  /// Adjusts the current overscan insets for a display. Typically this should
  /// either move the display along an axis (e.g. left+right have the same
  /// value) or scale it along an axis (e.g. top+bottom have opposite values).
  /// Each Adjust call is cumulative with previous calls since Start.
  /// |id|: The display's unique identifier.
  /// |delta|: The amount to change the overscan insets.
  void overscanCalibrationAdjust(
    id,
    delta,
  ) =>
      throw UnimplementedError();

  /// Resets the overscan insets for a display to the last saved value (i.e
  /// before Start was called).
  /// |id|: The display's unique identifier.
  void overscanCalibrationReset(id) => throw UnimplementedError();

  /// Complete overscan adjustments for a display  by saving the current values
  /// and hiding the overlay.
  /// |id|: The display's unique identifier.
  void overscanCalibrationComplete(id) => throw UnimplementedError();

  /// Displays the native touch calibration UX for the display with |id| as
  /// display id. This will show an overlay on the screen with required
  /// instructions on how to proceed. The callback will be invoked in case of
  /// successful calibration only. If the calibration fails, this will throw an
  /// error.
  /// |id|: The display's unique identifier.
  /// |callback|: Optional callback to inform the caller that the touch
  ///      calibration has ended. The argument of the callback informs if the
  ///      calibration was a success or not.
  void showNativeTouchCalibration(id) => throw UnimplementedError();

  /// Starts custom touch calibration for a display. This should be called when
  /// using a custom UX for collecting calibration data. If another touch
  /// calibration is already in progress this will throw an error.
  /// |id|: The display's unique identifier.
  void startCustomTouchCalibration(id) => throw UnimplementedError();

  /// Sets the touch calibration pairs for a display. These |pairs| would be
  /// used to calibrate the touch screen for display with |id| called in
  /// startCustomTouchCalibration(). Always call |startCustomTouchCalibration|
  /// before calling this method. If another touch calibration is already in
  /// progress this will throw an error.
  /// |pairs|: The pairs of point used to calibrate the display.
  /// |bounds|: Bounds of the display when the touch calibration was performed.
  ///     |bounds.left| and |bounds.top| values are ignored.
  void completeCustomTouchCalibration(
    pairs,
    bounds,
  ) =>
      throw UnimplementedError();

  /// Resets the touch calibration for the display and brings it back to its
  /// default state by clearing any touch calibration data associated with the
  /// display.
  /// |id|: The display's unique identifier.
  void clearTouchCalibration(id) => throw UnimplementedError();

  /// Sets the display mode to the specified mirror mode. Each call resets the
  /// state from previous calls. Calling setDisplayProperties() will fail for
  /// the mirroring destination displays.
  /// NOTE: This is only available to Chrome OS Kiosk apps and Web UI.
  /// |info|: The information of the mirror mode that should be applied to the
  ///     display mode.
  /// |callback|: Empty function called when the function finishes. To find out
  ///     whether the function succeeded, $(ref:runtime.lastError) should be
  ///     queried.
  void setMirrorMode(info) => throw UnimplementedError();

  /// Fired when anything changes to the display configuration.
  Stream get onDisplayChanged => throw UnimplementedError();
}

/// Layout position, i.e. edge of parent that the display is attached to.
enum LayoutPosition {
  top('top'),
  right('right'),
  bottom('bottom'),
  left('left');

  const LayoutPosition(this.value);

  final String value;
}

/// Mirror mode, i.e. different ways of how a display is mirrored to other
/// displays.
enum MirrorMode {
  /// Use the default mode (extended or unified desktop).
  off('off'),

  /// The default source display will be mirrored to all other displays.
  normal('normal'),

  /// The specified source display will be mirrored to the provided
  /// destination displays. All other connected displays will be extended.
  mixed('mixed');

  const MirrorMode(this.value);

  final String value;
}

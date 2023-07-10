import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSystemDisplayExtension on JSChrome {
  /// Use the `system.display` API to query display metadata.
  external JSSystemDisplay get systemDisplay;
}

@JS()
@staticInterop
class JSSystemDisplay {}

extension JSSystemDisplayExtension on JSSystemDisplay {
  /// Requests the information for all attached display devices.
  /// |flags|: Options affecting how the information is returned.
  /// |callback|: The callback to invoke with the results.
  external void getInfo(
    GetInfoFlags? flags,
    JSFunction callback,
  );

  /// Requests the layout info for all displays.
  /// NOTE: This is only available to Chrome OS Kiosk apps and Web UI.
  /// |callback|: The callback to invoke with the results.
  external void getDisplayLayout(JSFunction callback);

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
  external void setDisplayProperties(
    String id,
    DisplayProperties info,
    JSFunction callback,
  );

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
  external void setDisplayLayout(
    JSArray layouts,
    JSFunction callback,
  );

  /// Enables/disables the unified desktop feature. If enabled while mirroring
  /// is active, the desktop mode will not change until mirroring is turned
  /// off. Otherwise, the desktop mode will switch to unified immediately.
  /// NOTE: This is only available to Chrome OS Kiosk apps and Web UI.
  /// |enabled|: True if unified desktop should be enabled.
  external void enableUnifiedDesktop(bool enabled);

  /// Starts overscan calibration for a display. This will show an overlay
  /// on the screen indicating the current overscan insets. If overscan
  /// calibration for display |id| is in progress this will reset calibration.
  /// |id|: The display's unique identifier.
  external void overscanCalibrationStart(String id);

  /// Adjusts the current overscan insets for a display. Typically this should
  /// either move the display along an axis (e.g. left+right have the same
  /// value) or scale it along an axis (e.g. top+bottom have opposite values).
  /// Each Adjust call is cumulative with previous calls since Start.
  /// |id|: The display's unique identifier.
  /// |delta|: The amount to change the overscan insets.
  external void overscanCalibrationAdjust(
    String id,
    Insets delta,
  );

  /// Resets the overscan insets for a display to the last saved value (i.e
  /// before Start was called).
  /// |id|: The display's unique identifier.
  external void overscanCalibrationReset(String id);

  /// Complete overscan adjustments for a display  by saving the current values
  /// and hiding the overlay.
  /// |id|: The display's unique identifier.
  external void overscanCalibrationComplete(String id);

  /// Displays the native touch calibration UX for the display with |id| as
  /// display id. This will show an overlay on the screen with required
  /// instructions on how to proceed. The callback will be invoked in case of
  /// successful calibration only. If the calibration fails, this will throw an
  /// error.
  /// |id|: The display's unique identifier.
  /// |callback|: Optional callback to inform the caller that the touch
  ///      calibration has ended. The argument of the callback informs if the
  ///      calibration was a success or not.
  external void showNativeTouchCalibration(
    String id,
    JSFunction callback,
  );

  /// Starts custom touch calibration for a display. This should be called when
  /// using a custom UX for collecting calibration data. If another touch
  /// calibration is already in progress this will throw an error.
  /// |id|: The display's unique identifier.
  external void startCustomTouchCalibration(String id);

  /// Sets the touch calibration pairs for a display. These |pairs| would be
  /// used to calibrate the touch screen for display with |id| called in
  /// startCustomTouchCalibration(). Always call |startCustomTouchCalibration|
  /// before calling this method. If another touch calibration is already in
  /// progress this will throw an error.
  /// |pairs|: The pairs of point used to calibrate the display.
  /// |bounds|: Bounds of the display when the touch calibration was performed.
  ///     |bounds.left| and |bounds.top| values are ignored.
  external void completeCustomTouchCalibration(
    TouchCalibrationPairQuad pairs,
    Bounds bounds,
  );

  /// Resets the touch calibration for the display and brings it back to its
  /// default state by clearing any touch calibration data associated with the
  /// display.
  /// |id|: The display's unique identifier.
  external void clearTouchCalibration(String id);

  /// Sets the display mode to the specified mirror mode. Each call resets the
  /// state from previous calls. Calling setDisplayProperties() will fail for
  /// the mirroring destination displays.
  /// NOTE: This is only available to Chrome OS Kiosk apps and Web UI.
  /// |info|: The information of the mirror mode that should be applied to the
  ///     display mode.
  /// |callback|: Empty function called when the function finishes. To find out
  ///     whether the function succeeded, $(ref:runtime.lastError) should be
  ///     queried.
  external void setMirrorMode(
    MirrorModeInfo info,
    JSFunction callback,
  );

  /// Fired when anything changes to the display configuration.
  external ChromeEvent get onDisplayChanged;
}

/// Layout position, i.e. edge of parent that the display is attached to.
typedef LayoutPosition = JSString;

/// Mirror mode, i.e. different ways of how a display is mirrored to other
/// displays.
typedef MirrorMode = JSString;

@JS()
@staticInterop
class Bounds {}

extension BoundsExtension on Bounds {
  /// The x-coordinate of the upper-left corner.
  external int get left;

  /// The y-coordinate of the upper-left corner.
  external int get top;

  /// The width of the display in pixels.
  external int get width;

  /// The height of the display in pixels.
  external int get height;
}

@JS()
@staticInterop
class Insets {}

extension InsetsExtension on Insets {
  /// The x-axis distance from the left bound.
  external int get left;

  /// The y-axis distance from the top bound.
  external int get top;

  /// The x-axis distance from the right bound.
  external int get right;

  /// The y-axis distance from the bottom bound.
  external int get bottom;
}

@JS()
@staticInterop
class Point {}

extension PointExtension on Point {
  /// The x-coordinate of the point.
  external int get x;

  /// The y-coordinate of the point.
  external int get y;
}

@JS()
@staticInterop
class TouchCalibrationPair {}

extension TouchCalibrationPairExtension on TouchCalibrationPair {
  /// The coordinates of the display point.
  external Point get displayPoint;

  /// The coordinates of the touch point corresponding to the display point.
  external Point get touchPoint;
}

@JS()
@staticInterop
class TouchCalibrationPairQuad {}

extension TouchCalibrationPairQuadExtension on TouchCalibrationPairQuad {
  /// First pair of touch and display point required for touch calibration.
  external TouchCalibrationPair get pair1;

  /// Second pair of touch and display point required for touch calibration.
  external TouchCalibrationPair get pair2;

  /// Third pair of touch and display point required for touch calibration.
  external TouchCalibrationPair get pair3;

  /// Fourth pair of touch and display point required for touch calibration.
  external TouchCalibrationPair get pair4;
}

@JS()
@staticInterop
class DisplayMode {}

extension DisplayModeExtension on DisplayMode {
  /// The display mode width in device independent (user visible) pixels.
  external int get width;

  /// The display mode height in device independent (user visible) pixels.
  external int get height;

  /// The display mode width in native pixels.
  external int get widthInNativePixels;

  /// The display mode height in native pixels.
  external int get heightInNativePixels;

  /// The display mode UI scale factor.
  external double? get uiScale;

  /// The display mode device scale factor.
  external double get deviceScaleFactor;

  /// The display mode refresh rate in hertz.
  external double get refreshRate;

  /// True if the mode is the display's native mode.
  external bool get isNative;

  /// True if the display mode is currently selected.
  external bool get isSelected;

  /// True if this mode is interlaced, false if not provided.
  external bool? get isInterlaced;
}

@JS()
@staticInterop
class DisplayLayout {}

extension DisplayLayoutExtension on DisplayLayout {
  /// The unique identifier of the display.
  external String get id;

  /// The unique identifier of the parent display. Empty if this is the root.
  external String get parentId;

  /// The layout position of this display relative to the parent. This will
  /// be ignored for the root.
  external LayoutPosition get position;

  /// The offset of the display along the connected edge. 0 indicates that
  /// the topmost or leftmost corners are aligned.
  external int get offset;
}

@JS()
@staticInterop
class Edid {}

extension EdidExtension on Edid {
  /// 3 character manufacturer code. See Sec. 3.4.1 page 21. Required in v1.4.
  external String get manufacturerId;

  /// 2 byte manufacturer-assigned code, Sec. 3.4.2 page 21. Required in v1.4.
  external String get productId;

  /// Year of manufacturer, Sec. 3.4.4 page 22. Required in v1.4.
  external int get yearOfManufacture;
}

@JS()
@staticInterop
class DisplayUnitInfo {}

extension DisplayUnitInfoExtension on DisplayUnitInfo {
  /// The unique identifier of the display.
  external String get id;

  /// The user-friendly name (e.g. "HP LCD monitor").
  external String get name;

  /// NOTE: This is only available to Chrome OS Kiosk apps and Web UI.
  external Edid? get edid;

  /// Chrome OS only. Identifier of the display that is being mirrored if
  /// mirroring is enabled, otherwise empty. This will be set for all displays
  /// (including the display being mirrored).
  external String get mirroringSourceId;

  /// Chrome OS only. Identifiers of the displays to which the source display
  /// is being mirrored. Empty if no displays are being mirrored. This will be
  /// set to the same value for all displays. This must not include
  /// |mirroringSourceId|.
  external JSArray get mirroringDestinationIds;

  /// True if this is the primary display.
  external bool get isPrimary;

  /// True if this is an internal display.
  external bool get isInternal;

  /// True if this display is enabled.
  external bool get isEnabled;

  /// True for all displays when in unified desktop mode. See documentation
  /// for $(ref:enableUnifiedDesktop).
  external bool get isUnified;

  /// True when the auto-rotation is allowed. It happens when the device is in
  /// a tablet physical state or kSupportsClamshellAutoRotation is set.
  /// Provided for ChromeOS Settings UI only. TODO(stevenjb): Remove when
  /// Settings switches to a mojo API.
  external bool? get isAutoRotationAllowed;

  /// The number of pixels per inch along the x-axis.
  external double get dpiX;

  /// The number of pixels per inch along the y-axis.
  external double get dpiY;

  /// The display's clockwise rotation in degrees relative to the vertical
  /// position.
  /// Currently exposed only on ChromeOS. Will be set to 0 on other platforms.
  /// A value of -1 will be interpreted as auto-rotate when the device is in
  /// a physical tablet state.
  external int get rotation;

  /// The display's logical bounds.
  external Bounds get bounds;

  /// The display's insets within its screen's bounds.
  /// Currently exposed only on ChromeOS. Will be set to empty insets on
  /// other platforms.
  external Insets get overscan;

  /// The usable work area of the display within the display bounds. The work
  /// area excludes areas of the display reserved for OS, for example taskbar
  /// and launcher.
  external Bounds get workArea;

  /// The list of available display modes. The current mode will have
  /// isSelected=true. Only available on Chrome OS. Will be set to an empty
  /// array on other platforms.
  external JSArray get modes;

  /// True if this display has a touch input device associated with it.
  external bool get hasTouchSupport;

  /// True if this display has an accelerometer associated with it.
  /// Provided for ChromeOS Settings UI only. TODO(stevenjb): Remove when
  /// Settings switches to a mojo API. NOTE: The name of this may change.
  external bool get hasAccelerometerSupport;

  /// A list of zoom factor values that can be set for the display.
  external JSArray get availableDisplayZoomFactors;

  /// The ratio between the display's current and default zoom.
  /// For example, value 1 is equivalent to 100% zoom, and value 1.5 is
  /// equivalent to 150% zoom.
  external double get displayZoomFactor;
}

@JS()
@staticInterop
class DisplayProperties {}

extension DisplayPropertiesExtension on DisplayProperties {
  /// Chrome OS only. If set to true, changes the display mode to unified
  /// desktop (see $(ref:enableUnifiedDesktop) for details). If set to false,
  /// unified desktop mode will be disabled. This is only valid for the
  /// primary display. If provided, mirroringSourceId must not be provided and
  /// other properties will be ignored. This is has no effect if not provided.
  external bool? get isUnified;

  /// Chrome OS only. If set and not empty, enables mirroring for this display
  /// only. Otherwise disables mirroring for all displays. This value should
  /// indicate the id of the source display to mirror, which must not be the
  /// same as the id passed to setDisplayProperties. If set, no other property
  /// may be set.
  external String? get mirroringSourceId;

  /// If set to true, makes the display primary. No-op if set to false.
  /// Note: If set, the display is considered primary for all other properties
  /// (i.e. $(ref:isUnified) may be set and bounds origin may not).
  external bool? get isPrimary;

  /// If set, sets the display's overscan insets to the provided values. Note
  /// that overscan values may not be negative or larger than a half of the
  /// screen's size. Overscan cannot be changed on the internal monitor.
  external Insets? get overscan;

  /// If set, updates the display's rotation.
  /// Legal values are [0, 90, 180, 270]. The rotation is set clockwise,
  /// relative to the display's vertical position.
  external int? get rotation;

  /// If set, updates the display's logical bounds origin along the x-axis.
  /// Applied together with $(ref:boundsOriginY). Defaults to the current value
  /// if not set and $(ref:boundsOriginY) is set. Note that when updating the
  /// display origin, some constraints will be applied, so the final bounds
  /// origin may be different than the one set. The final bounds can be
  /// retrieved using $(ref:getInfo). The bounds origin cannot be changed on
  /// the primary display.
  external int? get boundsOriginX;

  /// If set, updates the display's logical bounds origin along the y-axis.
  /// See documentation for $(ref:boundsOriginX) parameter.
  external int? get boundsOriginY;

  /// If set, updates the display mode to the mode matching this value.
  /// If other parameters are invalid, this will not be applied. If the
  /// display mode is invalid, it will not be applied and an error will be
  /// set, but other properties will still be applied.
  external DisplayMode? get displayMode;

  /// If set, updates the zoom associated with the display. This zoom performs
  /// re-layout and repaint thus resulting in a better quality zoom than just
  /// performing a pixel by pixel stretch enlargement.
  external double? get displayZoomFactor;
}

@JS()
@staticInterop
class GetInfoFlags {}

extension GetInfoFlagsExtension on GetInfoFlags {
  /// If set to true, only a single $(ref:DisplayUnitInfo) will be returned
  /// by $(ref:getInfo) when in unified desktop mode (see
  /// $(ref:enableUnifiedDesktop)). Defaults to false.
  external bool? get singleUnified;
}

@JS()
@staticInterop
class MirrorModeInfo {}

extension MirrorModeInfoExtension on MirrorModeInfo {
  /// The mirror mode that should be set.
  external MirrorMode get mode;

  /// The id of the mirroring source display. This is only valid for 'mixed'.
  external String? get mirroringSourceId;

  /// The ids of the mirroring destination displays. This is only valid for
  /// 'mixed'.
  external JSArray? get mirroringDestinationIds;
}

/// resetCamera()

viewController.cameraLimitsRatio = CAMERA_LIMITS_RATIO;

viewController.panOut       = false;
viewController.panOutRatio  = PAN_OUT_RATIO;
viewController.panOutFactor = 1;

viewController.zoomIn        = false;
viewController.zoomInRatio   = ZOOM_IN_RATIO;
viewController.zoomInFactor  = 1;
viewController.dashOffset    = 0;
viewController.dashMaxOffset = MAX_DASH_OFFSET;

viewController.offsetVertically = false;
viewController.yOffset          = 0;
viewController.yOffsetMax       = MAX_Y_OFFSET;

viewController.originalHeight = min(settingsController.visualSettings[? "height"], MIN_VIEW_HEIGHT);
viewController.originalWidth  = viewController.originalHeight * (settingsController.visualSettings[? "width"] / settingsController.visualSettings[? "height"]);

viewController.viewShiftMax = MAX_VIEW_SHIFT;
viewController.viewXNoShift = view_xview[0];
viewController.viewYNoShift = view_yview[0];
viewController.xShift       = 0;
viewController.yShift       = 0;


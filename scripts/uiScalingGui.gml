///uiScalingGui()

var xTotal     = display_get_gui_width();
var yTotal     = display_get_gui_height();
var lineLength = xTotal * 0.1;

var x1 = (1 - menuController.uiScalingX) * xTotal * 0.5;
var y1 = (1 - menuController.uiScalingY) * yTotal * 0.5;
var x2 = xTotal - (1 - menuController.uiScalingX) * xTotal * 0.5;
var y2 = yTotal - (1 - menuController.uiScalingY) * yTotal * 0.5;

var lineWidth = 6;
var cornerFix = lineWidth * 0.5;

draw_line_width(
    x1,
    y1 - cornerFix,
    x1,
    y1 + lineLength,
    lineWidth
);

draw_line_width(
    x1,
    y2 - lineLength,
    x1,
    y2 + cornerFix,
    lineWidth
);

draw_line_width(
    x2,
    y1 - cornerFix,
    x2,
    y1 + lineLength,
    lineWidth
);

draw_line_width(
    x2,
    y2 - lineLength,
    x2,
    y2 + cornerFix,
    lineWidth
);

draw_line_width(
    x1 - cornerFix,
    y1,
    x1 + lineLength,
    y1,
    lineWidth
);

draw_line_width(
    x2 - lineLength,
    y1,
    x2 + cornerFix,
    y1,
    lineWidth
);

draw_line_width(
    x1 - cornerFix,
    y2,
    x1 + lineLength,
    y2,
    lineWidth
);

draw_line_width(
    x2 - lineLength,
    y2,
    x2 + cornerFix,
    y2,
    lineWidth
);

drawPressToCancelPrompt();


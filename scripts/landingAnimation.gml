///@description Control drawing scaling and image speed when landing

if (drawingScaleX > 1) {
    drawingScaleX = lerp(drawingScaleX, 1, 0.05);
}

if (drawingScaleY < 1) {
    drawingScaleY = lerp(drawingScaleY, 1, 0.05);
}

if (image_speed != IMAGESPEED) {
    image_speed   = lerp(image_speed, IMAGESPEED, 0.05);
}


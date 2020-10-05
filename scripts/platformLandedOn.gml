///@description Highlight platform landed on

if (!drawShadow) {
    eventFire(allEvents.removehighlight);
}

eventRegister(allEvents.removehighlight, id, removePlatformHighlight);

drawShadow = true;

propagateShadowEffect(shadowfx.add);


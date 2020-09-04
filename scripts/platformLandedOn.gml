///@description Highlight platform landed on

if (image_index != 1) {
    eventFire(allEvents.removehighlight);

    image_index = 1;

    eventRegister(allEvents.removehighlight, id, removePlatformHightlight);
}


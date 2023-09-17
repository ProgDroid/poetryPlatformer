///easeInCubicEaseOutSine

return ((argument0 < 0.5) * 4 * power(argument0, 3)) +
        (argument0 >= 0.5) * -(cos(pi * argument0) - 1) * 0.5;

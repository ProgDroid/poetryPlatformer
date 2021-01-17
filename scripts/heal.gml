///@description Heal the entity
if (hp < maxHp) {
    hp += 1;
}

maxDashes += (hp - 1) mod 2;
dashes     = maxDashes;


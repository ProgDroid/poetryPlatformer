//worldController.collectibles[? id.name] = true;
//worldController.collectiblesFound += 1;

worldController.collectiblesFound = worldController.collectiblesFound | bit;

with (objPlatforms) {
    if (variable_instance_exists(id, "associatedCollectible") && other.associatedPlatforms == associatedCollectible) {
        visible     = true;
        image_alpha = 0;
    }
}


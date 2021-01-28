# poetryPlatformer
A platforming game where you navigate a piece of poetry as the lost dot of an `i` trying to find a place where you belong

Some features include:
- Runtime level generation from [text files](datafiles/levels), with simple markup to define collectible placement and their associated platforms, player spawn point and level end trigger placement
- Partial controller support
- Support for different aspect ratios and resolutions
- Variable frame rate support
- Developer console
- Custom collisions with angle sweeping (using binary search) to enable walking on curved letters
- Several quality of life gameplay features such as coyote time and jump buffer

## Still to come
- Music and sound effects
- Menus (main, settings, pause)
- Full controller support (currently excludes the [dash mechanic](https://github.com/ProgDroid/poetryPlatformer/projects/1#card-52959709))

For more about the future of this project, check out the [project board](https://github.com/ProgDroid/poetryPlatformer/projects/1)

## GIFs and Screenshots
### Collectible Pickup
![Collectible Pickup](https://thumbs.gfycat.com/AromaticDopeyDutchshepherddog-size_restricted.gif)
### Level Ending
![Level Ending](https://thumbs.gfycat.com/FoolhardyPotableHerald-size_restricted.gif)
### Developer Console
![Dev Console](https://user-images.githubusercontent.com/18398887/106155337-76152880-6178-11eb-93ea-c6335835e2e3.png)

## How to play
Just download the standalone Windows executable release and have fun!

Use `A and D` or `arrow keys` to move. You can also use the `D-Pad` or the `left analog stick` with a controller

Press `Space` to jump (and double jump) or `A` on an Xbox controller or `X` on a Playstation one

Hold `Shift` in the air to start a dash, point with the mouse and confirm with `Space`. This is not currently supported on controller

Press `ESC` or `Start` to exit the game at any time

## Credits
Some solutions present here were based on:
- [fix-your-timestep](https://github.com/GameMakerDiscord/fix-your-timestep)
- Event system tutorials by [FriendlyCosmonaut](https://www.youtube.com/channel/UCKCKHxkH8zqV9ltWZw0JFig.gif)
- [FSM tutorial and example code](https://www.reddit.com/r/gamemaker/comments/353aq6/tutorialexample_finite_state_machines_the_most/) by PixelatedPope
- [Gaussian blur shader](https://www.youtube.com/watch?v=uwQvZR2nTbg) by Gaming Reverends

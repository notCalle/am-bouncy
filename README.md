# Bouncy Box "DVD" Screen Saver

This is a simple demo, making the minimal requirements for any modern 2D game.

- There is animated graphics

  A moving player sprite

- There is a physics model for the game world

  The sprite bounces off the screen edges

- There are game world reactions to user input

  Pressing space toggles pause of movement

- Game world exploration

  You have to play for a while to explore all the hidden rules of the world


## Develop

1. Download the Amulet game engine from [amulet.xyz].

2. Open main.lua in your favourite text editor.

3. Run `make run` (or `amulet` :) in this directory to try your changes.

```console
❯ open main.lua
❯ make run
```

[amulet.xyz]: https://amulet.xyz


## Package

1. Edit `conf.lua` with updated release details.

2. Run `make release` to build Linux/Mac/Win/Win64/HTML release packages. See `amulet help export` for all target options.

```console
❯ open conf.lua
❯ make release
```


## Contributions

[Bug reports] and [Pull requests] are welcome.

[Bug reports]: https://github.com/notCalle/am-bouncy/issues
[Pull requests]: https://github.com/notCalle/am-bouncy/pulls

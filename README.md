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


## Dragon Riders AMA

- Q: How many proud lines of code did you have to write?

  A: 90 lines with comments and spacing, maybe 50 proud lines of code, with some duplication? As always, I'm more proud of the code I deleted / didn't write. And grateful for all the glue code I didn't have to write.

- Q: How many different game engine concepts (eg: physics bodies, matrices, events, transforms, camera) did you have to be knowledgeable of before you could build your implementation?

  A: *Amulet* is pretty close to the minimalism of *Lua* itself, where there are only functions and tables, besides the primitive types.

  The first engine concept needed for this is the `am.window` to change the default title and dimensions of the game window, and attach the scene graph.

  I have mainly used this for 3D graphics before, and happen to know that there is a full featured camera in there, hidden behind a default affine transform matrix projecting the viewport plane 1:1 to the X/Y plane. Even though the default projection is a flat 1:1 2D, so there is no need to mess with the camera, the coordinate system is still in vector space, between pixels and the screen center is 0/0, which might be confusing if not coming from a mathematical or 3D graphics background.

  The second is the scene graph concept, with a hierarchical structure of nodes, where I only used the passive `am.group` as root node, and the pre-baked 2D X/Y-plane `am.rect` for the "sprite".

  The third concept is attaching functions to nodes as action callbacks, to perform the animation/physics, and input processing.

  I first tried to do clever sequencing of the builtin tweening actions for the animation/physics model, but quickly realized that the animation rules for this was much easier to express as custom functions.

- Q: Did you have to use classes, inheritance, structs or any other overly complex data structures? Why does the engine you are using require these complexities for such a trivial game?

  A: The scene graph concept might be considered a very complex concept indeed, but a simple scene makes for a simple graph, and the declarative style makes it easy to use, and maintain when the project grows.

- Q: How many times did you have to start and stop execution? What was the feedback loop like when you were developing?

  A: Countless times. I'm a sloppy programmer, and the Lua runtime typically aborts at the first error, with the usual call stack trace. For a larger project, the usual Lua unit test and code linting tools can be used.

- Q: Were you required to use a dedicated IDE? How long did it take you to get familiar with the IDE when you first started off?

  A: Anything that can execute a command and edit text files will do.

- Q: Is the source code for the game easily sharable? If you have to share more than just one file and some sprites, what else did you have to provide? What do these ancillary files represent?

  A: For a minimal game like this it's just two files. `main.lua` for the game, and `conf.lua` for game metadata, with the latter only needed to build release bundles.

- Q: How difficult was it to set up a 720p canvas?

  A: Setting two parameters to change the default window size.

- Q: How difficult was it to export to "all the platforms"?

  A: Only Linux/macOS/Windows are exported by default, other targets must be explicitly selected when exporting. I would assume iOS/Android targets will bring their own difficulties.

- Q: What was the output binary size?

  A: It depends heavily on the target platform. 0.5MB .zip for WASM/HTML target to 5.5MB .zip for Win64.

- Q: Be sensitive to what pains the engine of your choice puts you through to build the simplest of 2D game and ask yourself if it's acceptable. What could the engine have done better?

  A: The primary pain for me is not having an integrated debugger / repl, so the crash/edit/print()/retry cycle can get tedious.

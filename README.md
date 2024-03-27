# Godot Config

The Godot Config plugin adds an autoloaded object called Config to your Godot project.

The Config object loads all settings that are configured in your project's config file, parsed using [ini format](https://en.wikipedia.org/wiki/INI_file). By default, the name of the configuration file is `config.cfg`.

This can be changed by going into the addons > config > Config.tscn node and updating the exported variable called `FILEPATH`.

To use the Config object, simply access your config file key-value pairs as attributes. A default section can be defined in your config file to access values directly. All other values will be stored in a namespace under the section title.

Example:

```
; config.cfg

[default]
message="Hello, World!"

[player]
starting_gold=100
```

```
// script.gd

extends Node

_ready() -> void:
    print(Config.message)
    Player.gold = Config.player.starting_gold

```

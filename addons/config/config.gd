class_name ConfigLoader extends Node

@export var FILEPATH: String = "res://config.cfg"
@export var DEFAULT_SECTION: String = "default"

static var _config: Dictionary

func _ready() -> void:
	if not _config:
		var config_file = ConfigFile.new()
		if config_file.load(FILEPATH) != OK:
			push_error("[Critical]: Config file could not be loaded.")
			return
		_setup_config(config_file)
	else:
		push_error("[Error]: Config file already loaded.")


func _setup_config(
	config_file: ConfigFile
) -> void:
	for section_name in config_file.get_sections():
		var _section = {}
		for section_key in config_file.get_section_keys(section_name):
			_section[section_key] = config_file.get_value(
				section_name, section_key
			)
		_config[section_name] = _section
		
		


func _get(
	property: StringName
) -> Variant:
	return (
		_config.get(property, _config.get(DEFAULT_SECTION).get(property))
	)


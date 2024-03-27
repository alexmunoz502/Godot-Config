@tool
extends EditorPlugin

const DEFAULT_STUB_FILEPATH: StringName = "res://config.cfg"
const DEFAULT_STUB_SECTION: StringName = "default"


func _enter_tree() -> void:
	add_autoload_singleton("Config", "res://addons/config/Config.tscn")
	_create_stub_file()


func _exit_tree() -> void:
	remove_autoload_singleton("Config")


func _create_stub_file() -> void:
	if not FileAccess.file_exists(DEFAULT_STUB_FILEPATH):
		var config_file = ConfigFile.new()
		config_file.set_value(
			DEFAULT_STUB_SECTION, "message", "Hello, world!"
		)
		config_file.save(DEFAULT_STUB_FILEPATH)
		print("[Info]: '" + DEFAULT_STUB_FILEPATH + "' successfully created.")
		EditorInterface.get_resource_filesystem().scan()

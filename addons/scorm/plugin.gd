@tool
extends EditorPlugin

const AUTOLOAD_NAME = "Scorm"

const EXPORT_PLUGIN_SCRIPT := preload("res://addons/scorm-godot-plugin/addons/scorm/scorm_export.gd")
const PROJECT_SETTINGS_SCRIPT := preload("res://addons/scorm-godot-plugin/addons/scorm/scorm_project_settings.gd")

var _export_plugin = null

func _enter_tree():
	# Initialization of the plugin goes here.
	PROJECT_SETTINGS_SCRIPT.register_settings()
	add_autoload_singleton(AUTOLOAD_NAME, "res://addons/scorm-godot-plugin/addons/scorm/scorm.gd")
	_export_plugin = EXPORT_PLUGIN_SCRIPT.new()
	add_export_plugin(_export_plugin)


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_autoload_singleton(AUTOLOAD_NAME)
	remove_export_plugin(_export_plugin)
	_export_plugin = null

class_name ScormProjectSettings
extends RefCounted

const MOCK_CONFIG_SETTING := "scorm/mock_config"
const PERSIST_MOCK_CHANGES_SETTING := "scorm/persist_mock_changes"
const DEFAULT_MOCK_CONFIG := "res://addons/scorm-godot-plugin/addons/scorm/assets/scorm_mock_config.tres"
const DEFAULT_PERSIST_MOCK_CHANGES := false

static func register_settings() -> void:
	if !ProjectSettings.has_setting(MOCK_CONFIG_SETTING):
		ProjectSettings.set_setting(MOCK_CONFIG_SETTING, DEFAULT_MOCK_CONFIG)
	if !ProjectSettings.has_setting(PERSIST_MOCK_CHANGES_SETTING):
		ProjectSettings.set_setting(PERSIST_MOCK_CHANGES_SETTING, DEFAULT_PERSIST_MOCK_CHANGES)

	ProjectSettings.set_initial_value(MOCK_CONFIG_SETTING, DEFAULT_MOCK_CONFIG)
	ProjectSettings.set_initial_value(PERSIST_MOCK_CHANGES_SETTING, DEFAULT_PERSIST_MOCK_CHANGES)
	ProjectSettings.add_property_info({
		"name": MOCK_CONFIG_SETTING,
		"type": TYPE_STRING,
		"hint": PROPERTY_HINT_FILE,
		"hint_string": "*.tres,*.res",
	})
	ProjectSettings.add_property_info({
		"name": PERSIST_MOCK_CHANGES_SETTING,
		"type": TYPE_BOOL,
	})

static func get_mock_config() -> ScormMockConfig:
	var value: Variant = ProjectSettings.get_setting(MOCK_CONFIG_SETTING, DEFAULT_MOCK_CONFIG)
	if value is String && !value.is_empty():
		var resource := ResourceLoader.load(value)
		if resource is ScormMockConfig:
			return resource
		push_warning("SCORM mock config setting does not point to a ScormMockConfig resource: %s" % value)
	return ScormMockConfig.new()

static func should_persist_mock_changes() -> bool:
	var value: Variant = ProjectSettings.get_setting(
		PERSIST_MOCK_CHANGES_SETTING,
		DEFAULT_PERSIST_MOCK_CHANGES
	)
	if value is bool:
		return value
	return DEFAULT_PERSIST_MOCK_CHANGES

class_name ScormMockConfig
extends Resource

@export var persist_changes: bool = false
@export var data: Dictionary = {
	ScormKeys.STUDENT_NAME: "Ada Lovelace",
	ScormKeys.STUDENT_ID: "debug-001",
	ScormKeys.LESSON_MODE: "normal",
	ScormKeys.LESSON_STATUS: "not attempted",
	ScormKeys.LANGUAGE: "",
	ScormKeys.AUDIO: 0,
	ScormKeys.SPEED: 0,
	ScormKeys.TEXT: 0,
	ScormKeys.SUSPEND_DATA: "",
}

extends Control

@onready var path_text: TextEdit = %PathText

var found_scenes: Array[PackedScene] = []

func _on_scan_button_pressed() -> void:
	if path_text.text.is_empty():
		push_warning("The given path is empty!")
		return
	
	var found_scenes = ResourceUtil.find_scenes(path_text.text)
	print_debug("gug")

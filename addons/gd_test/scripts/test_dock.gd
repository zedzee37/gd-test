@tool
extends Control

@onready var _directory_label: Label = %DirectoryLabel

var dialog: EditorFileDialog

var _target_folder: String = "res://scenes/test/":
	set(value):
		_target_folder = value
		_directory_label.text = _get_target_folder_text(value)

func _ready() -> void:
	_directory_label.text = _get_target_folder_text(_target_folder)

func _get_target_folder_text(dir: String) -> String:
	return "Current Directory: " + dir

func _on_folder_select_button_pressed() -> void:
	if dialog != null:
		return

	dialog = EditorFileDialog.new()
	dialog.file_mode = EditorFileDialog.FILE_MODE_OPEN_DIR

	var screen_size := DisplayServer.screen_get_size()
	
	dialog.size = screen_size / 2

	add_child(dialog)

	dialog.move_to_center()
	dialog.show()

	dialog.dir_selected.connect(_on_folder_select_dialog_dir_selected)

func _on_folder_select_dialog_dir_selected(dir: String) -> void:
	_target_folder = dir + "/"
	dialog.queue_free()
	dialog = null

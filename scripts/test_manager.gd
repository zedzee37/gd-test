class_name TestManager
extends Node

@export var test_path: String = "res://test/"

func _ready() -> void:
	var scenes := _scan_test_directory()
	
	for scene: PackedScene in scenes:
		var sys: Node = scene.instantiate()

		if sys is not TestSystem:
			continue

		print("Running test system: {}".format([sys.name], "{}"))

		add_child(sys)
		
		if not sys.ran:
			await sys.ran_tests

		sys.queue_free()

func _scan_test_directory() -> Array[PackedScene]:
	var test_scenes: Array[PackedScene] = []

	var resources: PackedStringArray = ResourceLoader.list_directory(test_path)
	for file_path: String in resources:
		var fp := test_path + file_path
		
		if ResourceLoader.exists(fp, "PackedScene"):
			var scene: Resource = load(fp)

			if scene is PackedScene:
				test_scenes.append(scene)

	return test_scenes

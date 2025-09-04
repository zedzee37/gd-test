class_name TestSystem
extends Node

var _tests: Array[Test] = []

func _enter_tree() -> void:
	if TestManager != null:
		TestManager.add_system(self)

func _ready() -> void:
	_collect_tests()
	run()

func _collect_tests() -> void:
	for child: Node in get_children():
		if child is Test:
			_tests.append(child)

func run() -> void:
	for test: Test in _tests:
		var results: Array[TestBuilder.Result] = test.run().results

		var i: int = 1
		for result: TestBuilder.Result in results:
			i += 1
			if result.success:
				_print_success(result.test_info, i)
			else:
				_print_error(result.test_info, i)

func _print_error(test_info: TestBuilder.TestInfo, idx: int) -> void:
	_print_result(false, idx, test_info, "has failed! :( - {}".format([test_info.error_msg], "{}"))

func _print_success(test_info: TestBuilder.TestInfo, idx: int) -> void:
	_print_result(true, idx, test_info, "has succeeded :)")

func _print_result(success: bool, idx: int, test_info: TestBuilder.TestInfo, body: String) -> void:
	var s: String = "[{}] {}: ".format([idx, test_info.test_name], "{}") + body
	if success:
		print(s)
	else:
		printerr(s)
	
	

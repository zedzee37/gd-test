@tool
extends Node

var _systems: Array[TestSystem] = []

func add_system(system: TestSystem) -> void:
	_systems.append(system)

func run() -> void:
	for sys: TestSystem in _systems:
		sys.run()

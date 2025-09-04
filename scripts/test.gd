class_name Test
extends Node

@export var test_name: String = ""

func run() -> TestBuilder:
	return TestBuilder.new()

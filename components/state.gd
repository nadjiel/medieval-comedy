extends Node

## A State that can be used with a StateMachine for state logic
class_name State

signal transition

var state_name: String

func _enter_state() -> void:
	pass

func _exit_state() -> void:
	pass

func _process_state(delta: float) -> void:
	pass

func _physics_process_state(delta: float) -> void:
	pass

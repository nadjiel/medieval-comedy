extends Node

class_name StateMachine

@export var initial_state: State

var states: Dictionary = {}
var current_state: State

func _ready():
	for child in get_children():
		if(child is State):
			states[child.state_name] = child
			child.transition.connect(on_transition)
	
	if initial_state:
		current_state = initial_state
		initial_state._enter_state()

func _process(delta: float) -> void:
	if current_state:
		current_state._process_state(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state._physics_process_state(delta)

func on_transition(state: State) -> void:
	if current_state: current_state._exit_state()
	current_state = state
	state._enter_state()

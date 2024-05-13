extends State

@onready var run_state = $"../RunState"

func _ready():
	state_name = "idle"

func _enter_state() -> void:
	super._enter_state()
	transition.emit(run_state)

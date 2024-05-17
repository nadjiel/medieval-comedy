extends State

## The maximum amount of time in seconds this state remains
@export var max_state_duration: float = 5.0
## The minimum amount of time in seconds this state remains
@export var min_state_duration: float = 2.0

@onready var sheep = $"../.."
@onready var animation_player = $"../../AnimationPlayer"
@onready var idle_state = $"../IdleState"

var state_duration: float = min_state_duration
var state_timer: float = 0.0

func _ready() -> void:
	state_name = "bounce"

func _enter_state() -> void:
	animation_player.play("bounce")
	state_duration = randf_range(min_state_duration, max_state_duration)
	
	sheep.input_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	print(sheep.input_direction)

func _exit_state() -> void:
	state_timer = 0.0
	
	# WARNING: setting velocity outside physics process
	sheep.velocity = Vector2.ZERO

func _process_state(delta: float) -> void:
	state_timer = clampf(state_timer + delta, 0.0, state_duration)
	
	if state_timer == state_duration:
		transition.emit(idle_state)
	
	sheep.adjust_sprite_side()

func _physics_process_state(delta: float) -> void:
	sheep.move()

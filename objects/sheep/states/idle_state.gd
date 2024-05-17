extends State

## The maximum amount of time in seconds this state remains
@export var max_state_duration: float = 5.0
## The minimum amount of time in seconds this state remains
@export var min_state_duration: float = 2.0

@onready var animation_player = $"../../AnimationPlayer"
@onready var party_area = $"../../PartyArea"
@onready var bounce_state = $"../BounceState"
@onready var follow_state = $"../FollowState"

var state_duration: float = min_state_duration
var state_timer: float = 0.0

func _ready() -> void:
	state_name = "idle"
	party_area.body_entered.connect(on_body_entered)

func _enter_state() -> void:
	animation_player.play("idle")
	state_duration = randf_range(min_state_duration, max_state_duration)

func _exit_state() -> void:
	state_timer = 0.0

func _process_state(delta: float) -> void:
	state_timer = clampf(state_timer + delta, 0.0, state_duration)
	
	if state_timer == state_duration:
		transition.emit(bounce_state)

func on_body_entered(body: Node2D) -> void:
	if !body.is_in_group("players"): return
	if !(body is Character): return
	
	follow_state.target = body
	transition.emit(follow_state)

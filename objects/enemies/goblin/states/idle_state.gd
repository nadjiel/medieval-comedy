extends State

@onready var goblin = $"../.."
@onready var animation_player = $"../../AnimationPlayer"
@onready var follow_state = $"../FollowState"

func _ready():
	state_name = "idle"

func _enter_state():
	animation_player.play("idle")

func _process_state(delta: float) -> void:
	if goblin.should_chase(): transition.emit(follow_state)

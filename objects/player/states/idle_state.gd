extends State

@onready var player = $"../.."
@onready var animation_player = $"../../AnimationPlayer"
@onready var run_state = $"../RunState"
@onready var attack_state = $"../AttackState"

func _ready():
	state_name = "idle"

func _enter_state() -> void:
	animation_player.play("idle")

func _process_state(_delta: float) -> void:
	if !player.input_direction.is_zero_approx():
		transition.emit(run_state)
	
	if player.input_attack:
		transition.emit(attack_state)
	
	player.adjust_sprite_side()

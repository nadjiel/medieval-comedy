extends Character

@onready var sword_attack_area: AttackArea = $SwordAttackArea

var input_attack: bool

func _process(delta: float) -> void:
	GameManager.player_position = position
	input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	input_attack = Input.is_action_just_pressed("attack")

func attack() -> void:
	sword_attack_area.attack(facing_direction)

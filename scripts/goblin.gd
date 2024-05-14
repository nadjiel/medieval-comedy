extends Enemy

@export var combat_distance: float = 90
@onready var attack_area = $AttackArea

func _process(_delta: float) -> void:
	input_direction = (GameManager.player_position - position).normalized()

func should_chase() -> bool:
	return position.distance_to(GameManager.player_position) > combat_distance

func attack() -> void:
	attack_area.attack(facing_direction)

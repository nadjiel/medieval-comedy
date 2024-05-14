extends Area2D

## Represents a collectible item
class_name Collectible

@export var heal_points: float

func _ready() -> void:
	body_entered.connect(on_body_entered)

func on_body_entered(body: Node2D) -> void:
	if !body.is_in_group("players"): return
	
	var player: Character = body
	
	player.heal(heal_points)
	
	queue_free()

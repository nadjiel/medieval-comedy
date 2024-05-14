extends Area2D

class_name AttackArea

@export var damage: float
@export_range(-1, 1) var attack_range: float
@export var target_group: String

func attack(
	attack_direction: Vector2,
	attack_range: float = self.attack_range
) -> void:
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if !(body.is_in_group(target_group)): continue
		if !(body is Character): continue
		
		var enemy: Character = body
		
		# Using global position instead of simply position to get the position
		# on the canvas
		var enemy_direction: Vector2 = (enemy.position - global_position).normalized()
		
		var dot_product = enemy_direction.dot(attack_direction)
		
		if(dot_product >= attack_range):
			enemy.damage(damage)

extends Area2D

## Area2D that serves as a hitbox for an attack
class_name AttackArea

@export var damage: float = 0
@export_range(-1, 1) var attack_range: float = -1
@export var target_group: String = ""

func attack(
	attack_direction: Vector2 = Vector2.RIGHT,
	damage: float = self.damage,
	attack_range: float = self.attack_range,
	target_group: String = self.target_group
) -> void:
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if target_group != "" && !(body.is_in_group(target_group)): continue
		if !(body is Character): continue
		
		var enemy: Character = body
		
		# Using global position instead of simply position to get the position
		# on the canvas
		var enemy_direction: Vector2 = (enemy.position - global_position).normalized()
		
		var dot_product = enemy_direction.dot(attack_direction)
		
		if(dot_product >= attack_range):
			enemy.damage(damage)

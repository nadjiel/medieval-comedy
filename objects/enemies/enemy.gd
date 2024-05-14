extends CharacterBody2D

class_name Enemy

# WARNING: HealthBar should be searched by type, not by name
@onready var health_bar: HealthBar = $HealthBar

func damage(amount: float) -> void:
	if health_bar: health_bar.damage(amount)
	print(self.name, " damaged, health: ", health_bar.health)

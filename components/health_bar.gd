extends Node

class_name HealthBar

signal die

@export var max_health: float = 10.0
@export var death_effect: PackedScene

var health: float = max_health

func damage(amount: float) -> void:
	health = clampf(health - amount, 0, max_health)
	if(health == 0.0): die.emit(death_effect)

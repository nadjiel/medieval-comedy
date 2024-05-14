extends Node

class_name HealthBar

signal damaged
signal die

@export var max_health: float = 10.0
@export_color_no_alpha var damage_color: Color = Color.RED
@export var death_effect: PackedScene

var health: float = max_health

func damage(amount: float) -> void:
	health = clampf(health - amount, 0, max_health)
	damaged.emit(damage_color)
	if(health == 0.0): die.emit(death_effect)

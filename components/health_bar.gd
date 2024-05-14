extends Node

class_name HealthBar

signal damaged
signal die

@export var max_health: float = 10.0

var health: float = max_health

func damage(amount: float) -> void:
	health = clampf(health - amount, 0, max_health)
	damaged.emit()
	
	if(health == 0.0): die.emit()

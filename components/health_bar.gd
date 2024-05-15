extends Node

## This component can be used as a child of a Character to manage its health
class_name HealthBar

signal updated(health: float)
signal damaged(amount: float)
signal die
signal healed(amount: float)
signal replenished

@export var max_health: float = 10.0

var health: float = max_health

func damage(amount: float) -> void:
	health = clampf(health - amount, 0, max_health)
	updated.emit(health)
	damaged.emit(amount)
	
	if(health == 0.0): die.emit()

func heal(amount: float) -> void:
	health = clampf(health + amount, 0, max_health)
	updated.emit(health)
	healed.emit(amount)
	
	if(health == max_health): replenished.emit()

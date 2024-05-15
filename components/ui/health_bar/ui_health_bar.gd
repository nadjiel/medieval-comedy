extends ProgressBar

## Expects a HealthBar component from which this UIHealthBar will get its values
@export var health_bar: HealthBar

var new_value: float = value

func _ready():
	if !health_bar: return
	
	on_updated(health_bar.health)
	health_bar.updated.connect(on_updated)

func _process(delta: float) -> void:
	value = lerp(value, new_value, .25)

func on_updated(health: float) -> void:
	new_value = health / health_bar.max_health

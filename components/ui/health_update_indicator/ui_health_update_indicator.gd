extends Control

## Expects a HealthBar component from which this UIHealthUpdateIndicator will get its
## values.
@export var health_bar: HealthBar
## Tells if this UIHealthUpdateIndicator should show damages taken.
@export var show_damage: bool = true
## Tells if this UIHealthUpdateIndicator should show health healed.
@export var show_heal: bool = true

@onready var label_scene: PackedScene = preload("res://components/ui/health_update_indicator/ui_health_update_indicator_label.tscn")

func _ready() -> void:
	if !health_bar: return
	
	health_bar.damaged.connect(on_damaged)
	health_bar.healed.connect(on_healed)

func on_damaged(amount: float) -> void:
	if !show_damage: return
	
	var label: Label = label_scene.instantiate()
	label.text = str(amount)
	label.label_settings.font_color = Color.RED
	add_child(label)

func on_healed(amount: float) -> void:
	if !show_heal: return
	
	var label: Label = label_scene.instantiate()
	label.text = str(amount)
	label.label_settings.font_color = Color.DEEP_SKY_BLUE
	add_child(label)

extends State

@onready var goblin = $"../.."

func _ready():
	state_name = "follow"

func _physics_process_state(_delta: float) -> void:
	goblin.move()

extends State

@onready var enemy_spawner: SceneSpawner = $"../../EnemySpawner"
@onready var ui: CanvasLayer = $"../../UI"
const GOBLIN = preload("res://objects/enemies/goblin/goblin.tscn")
const UI_CHAPTER_TITLE = preload("res://components/ui/chapter_title/ui_chapter_title.tscn")

func _ready() -> void:
	state_name = "First wave"

func _enter_state() -> void:
	var ui_chapter_title: Node = UI_CHAPTER_TITLE.instantiate()
	ui_chapter_title.title = state_name
	ui.add_child(ui_chapter_title)
	ui_chapter_title.disappeared.connect(on_title_disappear)

func on_title_disappear() -> void:
	enemy_spawner.packed_scenes.append(GOBLIN)
	enemy_spawner.spawn_per_minute = 60

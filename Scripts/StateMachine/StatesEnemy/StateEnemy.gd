class_name StateEnemy extends State

@onready var players

const IDLE = "idle"
const RUNNING = "running"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(owner is Enemy, "StateEnemy Class belongs only to Enemy class!")#
	players = get_tree().get_nodes_in_group("Players")

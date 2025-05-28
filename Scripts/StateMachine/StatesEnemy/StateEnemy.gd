class_name StateEnemy extends State

@onready var players

const IDLE = "StateIdle"
const RUN = "StateRun"
const ATK = "StateAtk"
const RUNCIRCLE = "StateRunCircle"

enum inRangeBehavior {ATK, CIRCLE}

@export var enemy : Enemy = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(owner is Enemy, "StateEnemy Class belongs only to Enemy class!")#
	players = get_tree().get_nodes_in_group("Players")

func closestPlayer() -> Player:
	var closestPlayer: Player
	var closestDistance := 10000.0
	for p in players:
		var distanceToPlayer := enemy.global_position.distance_to(p.global_position)
		if(distanceToPlayer < closestDistance):
			closestDistance = distanceToPlayer
			closestPlayer = p
	return closestPlayer
	

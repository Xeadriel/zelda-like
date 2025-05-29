class_name StateEnemy extends State

@onready var players

@export var entity: Enemy = null

const IDLE = "StateIdle"
const RUN = "StateRun"
const ATK = "StateAtk"
const RUNCIRCLE = "StateRunCircle"

enum inRangeBehavior {ATK, CIRCLE}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(owner is Enemy, "StateEnemy Class belongs only to Enemy class!")
	players = get_tree().get_nodes_in_group("Players")

func closestPlayer() -> Player:
	var closestPlayer: Player
	var closestDistance := 10000.0
	for p in players:
		var distanceToPlayer := entity.global_position.distance_to(p.global_position)
		if(distanceToPlayer < closestDistance):
			closestDistance = distanceToPlayer
			closestPlayer = p
	return closestPlayer
	

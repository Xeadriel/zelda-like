## Virtual base class for all states.
## Extend this class and override its methods to implement a state.
extends StateEnemy

@export var SPEED : float = 1.0
@export var circleRadius: float = 100.0
@export var minDuration: float = 2
@export var maxDuration: float = 5

var duration: float
var directionChanger: int

## Called by the state machine when receiving unhandled input events.
func handleInput() -> void:
	pass

## Called by the state machine on the engine's main loop tick.
func process(_delta: float) -> void:
	pass

## Called by the state machine on the engine's physics update tick.
func physicsProcess(_delta: float) -> void:
	var target: Player = closestPlayer()
	var inRange: bool = entityNew.atkRange >= entityNew.global_position.distance_to(target.global_position)
	if (target && inRange && duration > 0):
		duration -= _delta
		var diffVector = entityNew.global_position - target.global_position
		var tangent = Vector2(-diffVector.y * directionChanger, diffVector.x * directionChanger).normalized()
		entityNew.velocity = tangent * SPEED * circleRadius
	else:
		finished.emit(IDLE)

## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
	duration = randi_range(minDuration, maxDuration)
	directionChanger = [-1, 1][randi() % 2]
	
## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass

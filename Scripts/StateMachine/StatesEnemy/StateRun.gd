## Virtual base class for all states.
## Extend this class and override its methods to implement a state.
extends StateEnemy

@export var SPEED : int

## Called by the state machine when receiving unhandled input events.
func handleInput() -> void:
	pass

## Called by the state machine on the engine's main loop tick.
func process(_delta: float) -> void:
	pass

## Called by the state machine on the engine's physics update tick.
func physicsProcess(_delta: float) -> void:
	var target: Player = closestPlayer()
	if (enemy.atkRange < enemy.global_position.distance_to(target.global_position)):
		var direction := enemy.global_position.direction_to(target.global_position)
		enemy.velocity = direction.normalized() * SPEED
	else:
		finished.emit(IDLE)

## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
	pass

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass

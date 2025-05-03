extends StateEnemy

@export var slowDownSpeed := 200.0
## Called by the state machine on the engine's main loop tick.
func process(_delta: float) -> void:
	pass

## Called by the state machine on the engine's physics update tick.
func physicsProcess(_delta: float) -> void:
	var target: Player = closestPlayer()
	if (entity.atkRange >= entity.global_position.distance_to(target.global_position)):
		entity.velocity = entity.velocity.move_toward(Vector2.ZERO, slowDownSpeed)
		match randi_range(0, 1):
			0:
				finished.emit(ATK)
			1:
				finished.emit(RUNCIRCLE)
	else:
		finished.emit(RUN)
	
## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
	pass

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass

extends StateEnemy

@export var slowDownSpeed = 100
## Called by the state machine on the engine's main loop tick.
func process(_delta: float) -> void:
	pass

## Called by the state machine on the engine's physics update tick.
func physicsProcess(_delta: float) -> void:
	entity.velocity = entity.velocity.move_toward(Vector2.ZERO, _delta*slowDownSpeed)
	entity.move_and_slide()
	
	var closestDistance := 1000.0
	for player in players:
		if entity.global_position.distance_to(player) < closestDistance:
			
	
## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
	entity.velocity.x = 0.0
	entity.velocity.y = 0.0

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass

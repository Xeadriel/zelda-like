extends StateEnemy

@export var telegraphTime := 0.5

var hitbox: Area2D
var canAtk: bool = true
var elapsedTime: float

## Called by the state machine on the engine's main loop tick.
func process(_delta: float) -> void:
	pass
	
## Called by the state machine on the engine's physics update tick.
func physicsProcess(_delta: float) -> void:
	if canAtk:
		entityNew.rotation += 0.1
		elapsedTime += _delta
		if elapsedTime >= telegraphTime:
			canAtk = false
	else:
		updateHitbox()
		finished.emit(IDLE)

## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
	elapsedTime = 0.0
	hitbox = Area2D.new()

func updateHitbox():
	if entityNew.global_position.x > entityNew.target.global_position.x:
		hitbox.position = Vector2(entityNew.atkRange, 0) * -1
	else:
		hitbox.position = Vector2(entityNew.atkRange, 0)

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass

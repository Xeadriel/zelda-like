extends StateEnemy

@export var aspd := 1.0

@onready var atkCooldown = $AtkCooldown

var canAtk: bool = true
var elapsedTime: float

## Called by the state machine on the engine's main loop tick.
func process(_delta: float) -> void:
	pass
	
	
## Called by the state machine on the engine's physics update tick.
func physicsProcess(_delta: float) -> void:
	if canAtk:
		entity.rotation += 0.1
		elapsedTime += _delta
		if elapsedTime >= aspd:
			canAtk = false
	else:
		if atkCooldown.is_stopped():
			atkCooldown.start(2.0)
		finished.emit(IDLE)

## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
	elapsedTime = 0.0

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass


func _canAtk() -> void:
	canAtk = true

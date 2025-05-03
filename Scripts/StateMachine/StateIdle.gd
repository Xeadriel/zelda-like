class_name StateIdle extends State

@export var SLOWDOWNSPEED : int

func process(_delta: float) -> void:
	pass

func physicsProcess(delta: float) -> void:
	if Input.is_action_pressed("hit"):
		finished.emit("StateAttack")
	elif (Input.is_action_pressed("left") or
		Input.is_action_pressed("right") or
		Input.is_action_pressed("up") or
		Input.is_action_pressed("down")
		):
		finished.emit("StateRun")
	else:
		entity = entity as Player
		entity.velocity = entity.velocity.move_toward(Vector2.ZERO, SLOWDOWNSPEED)

func enter(previous_state_path: String, data := {}) -> void:
	pass

func exit() -> void:
	pass

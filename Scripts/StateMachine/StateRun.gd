class_name StateRun extends State

@export var SPEED : int

func handleInput() -> void:
	pass

func process(_delta: float) -> void:
	pass

func physicsProcess(delta: float) -> void:
	if (Input.is_action_pressed("left") or
		Input.is_action_pressed("right") or
		Input.is_action_pressed("up") or
		Input.is_action_pressed("down")
		):
		var direction :=  Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
		if direction:
			entity.velocity = direction.normalized() * SPEED
		else:
			entity.velocity = entity.velocity.move_toward(Vector2.ZERO, SPEED)
	else:
		finished.emit("StateIdle")

func enter(previous_state_path: String, data := {}) -> void:
	pass

func exit() -> void:
	pass

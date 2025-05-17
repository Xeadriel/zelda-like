class_name StateRun extends State

@export var SPEED : int

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

func handleInput() -> void:
	pass

func process(_delta: float) -> void:
	pass

func physicsProcess(_delta: float) -> void:
	if Input.is_action_just_pressed("hit"):
		finished.emit("StateAttack")
	elif Input.is_action_just_pressed("block"):
		finished.emit("StateBlock")
		
	var direction :=  Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	if direction:
		entity.velocity = direction.normalized() * SPEED
		setPlayerDirection(direction)
	else:
		finished.emit("StateIdle")

func setPlayerDirection(direction : Vector2) -> void:
	if direction.y < 0:
		entity.direction = Direction.UP
	elif direction.y > 0:
		entity.direction = Direction.DOWN

	# horizontal direction prioritized over vertical direction
	if direction.x < 0:
		entity.direction = Direction.LEFT
	elif direction.x > 0:
		entity.direction = Direction.RIGHT

func enter(_previous_state_path: String, _data := {}) -> void:
	pass

func exit() -> void:
	pass

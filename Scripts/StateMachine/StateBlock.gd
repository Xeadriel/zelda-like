class_name StateBlock extends State

@export var BLOCK_DELAY : float
var blockTimer : float = 0

func process(delta: float) -> void:
	# do stuff on timer then go to idle
	blockTimer += delta
	entity.velocity = Vector2.ZERO
	if blockTimer >= BLOCK_DELAY:
		blockTimer = 0
		finished.emit("StateIdle")

func physicsProcess(_delta: float) -> void:
	pass

func enter(_previous_state_path: String, _data := {}) -> void:
	blockTimer = 0
	entity.block()

func exit() -> void:
	blockTimer = 0
	entity.stopBlock()
	

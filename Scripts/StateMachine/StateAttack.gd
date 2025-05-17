class_name StateAttack extends State

@export var ATTACK_DELAY : float
var attackTimer : float = 0

func handleInput() -> void:
	pass

func process(delta: float) -> void:
	# do stuff on timer then go to idle
	attackTimer += delta
	entity.velocity = Vector2.ZERO
	if attackTimer >= ATTACK_DELAY:
		attackTimer = 0
		finished.emit("StateIdle")

func physicsProcess(_delta: float) -> void:
	pass

func enter(_previous_state_path: String, _data := {}) -> void:
	attackTimer = 0
	entity.attack()

func exit() -> void:
	attackTimer = 0
	entity.stopAttack()

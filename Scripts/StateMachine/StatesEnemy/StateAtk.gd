extends StateEnemy

var hitbox: Area2D
var canAtk: bool = true
var elapsedTime: float

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

func _ready() -> void:
	super()
	entity.animationFinishedSignal.connect(animationFinished)

func process(_delta: float) -> void:
	pass
	
func physicsProcess(delta: float) -> void:
	pass

func enter(_previous_state_path: String, _data := {}) -> void:
	entity.target = getClosestPlayer()
	entity.velocity = Vector2.ZERO
	hitbox = Area2D.new()
	entity.attack()
	updateHitbox()

func updateHitbox():
	if entity.global_position.x > entity.target.global_position.x:
		hitbox.position = Vector2(entity.atkRange, 0) * -1
	else:
		hitbox.position = Vector2(entity.atkRange, 0)

func exit() -> void:
	pass

func animationFinished(animatedSprite: AnimatedSprite2D) -> void:
	if animatedSprite.animation not in ["attackFront", "attackBack", "attackLeft", "attackRight"]:
		return
	
	finished.emit(RUNCIRCLE)

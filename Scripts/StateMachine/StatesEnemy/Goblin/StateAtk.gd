extends StateEnemy

@export var nextState = RUNCIRCLE

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
	
func physicsProcess(_delta: float) -> void:
	pass

func enter(_pssssssrevious_state_path: String, _data := {}) -> void:
	entity.target = getClosestPlayer()
	entity.velocity = Vector2.ZERO
	entity.attack()

func exit() -> void:
	entity.stopAttack()

func animationFinished(animatedSprite: AnimatedSprite2D) -> void:
	if animatedSprite.animation not in ["attackFront", "attackBack", "attackLeft", "attackRight"]:
		return
	
	finished.emit(nextState)

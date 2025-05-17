class_name Player extends CharacterBody2D

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

var direction = Direction.DOWN

@onready var attackUp : Area2D = $AttackUp
@onready var attackDown : Area2D = $AttackDown
@onready var attackLeft : Area2D = $AttackLeft
@onready var attackRight : Area2D= $AttackRight

var blockTimeStamp = 0

func _physics_process(_delta: float) -> void:
	move_and_slide()

# attacks in facing direction
func attack() -> void:
	match direction:
		Direction.UP:
			attackUp.process_mode = PROCESS_MODE_INHERIT
			attackUp.visible = true
		Direction.DOWN:
			attackDown.process_mode = PROCESS_MODE_INHERIT
			attackDown.visible = true
		Direction.LEFT:
			attackLeft.process_mode = PROCESS_MODE_INHERIT
			attackLeft.visible = true
		Direction.RIGHT:
			attackRight.process_mode = PROCESS_MODE_INHERIT
			attackRight.visible = true

func stopAttack() -> void:
	attackUp.visible = false
	attackDown.visible = false
	attackLeft.visible = false
	attackRight.visible = false
	attackUp.process_mode = PROCESS_MODE_DISABLED
	attackDown.process_mode = PROCESS_MODE_DISABLED
	attackLeft.process_mode = PROCESS_MODE_DISABLED
	attackRight.process_mode = PROCESS_MODE_DISABLED
	print(attackRight.visible)


# blocks in facing direction
func block() -> void:
	blockTimeStamp = Time.get_ticks_msec()

func stopBlock() -> void:
	blockTimeStamp = 0

# signal when area2D collides with something
func swordHitSomething(body: Node2D) -> void:
	if body is Enemy:
		var enemy : Enemy = body
		enemy.takeDamage(1)

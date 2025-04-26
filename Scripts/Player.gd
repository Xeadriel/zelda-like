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

func _physics_process(_delta: float) -> void:
	move_and_slide()

# attacks in facing direction
func attack() -> void:
	match direction:
		Direction.UP:
			attackUp.paused = false
		Direction.DOWN:
			attackDown.paused = false
		Direction.LEFT:
			attackLeft.paused = false
		Direction.RIGHT:
			attackRight.paused = false

# blocks in facing direction
func block() -> void:
	pass

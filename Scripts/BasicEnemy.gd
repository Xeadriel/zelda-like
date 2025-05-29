class_name Enemy extends CharacterBody2D

@export var maxHp := 100
@export var atkRange := 100.0

var target: Player

var currentHp: int:
	set(newHP):
		currentHp = newHP
		if currentHp < 1:
			print("BOOM!")
			queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currentHp = maxHp


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	
func _physics_process(_delta: float) -> void:
	move_and_slide()
	
func takeDamage(dmg: int) -> void:
	currentHp -= dmg

class_name Enemy extends CharacterBody2D

@export var maxHp := 100
@export var player: PackedScene
@export var mvSpeed := 20
@export var range := 50

var currHp: int:
	set(newHP):
		currHp = newHP
		if currHp < 1:
			print("BOOM!")
			queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currHp = maxHp


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	

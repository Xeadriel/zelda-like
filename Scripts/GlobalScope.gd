extends Node

var currentScene = null

func _ready():
	get_window().content_scale_size = Vector2(2560, 1440)
	
	var currentScene = get_tree().get_current_scene()

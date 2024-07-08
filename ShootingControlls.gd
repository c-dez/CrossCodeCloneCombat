extends Node2D

@onready var cross_hair = get_node("CrosshairSprite")

func _process(delta):
	cross_hair.position = get_global_mouse_position()

extends Node2D

@onready var cross_hair = get_node("CrosshairSprite")
@onready var player = get_node("../Player")
func _ready():
	pass

func _physics_process(_delta):
	CrosshairPosition()
	queue_redraw()

	pass

func CrosshairPosition():
	cross_hair.position = get_global_mouse_position()
	pass

	
func _draw():
	draw_line(player.position,get_global_mouse_position(), Color(1,0,0,1), -1.0, true)

extends Node2D

@onready var cross_hair = get_node("CrosshairSprite")
@onready var player = get_node("../Player")

@onready var bullet_starting = get_node("../Player/BulletArm/BulletStartingPoint")

# parametros drawn_line()
var color:Color = Color(0,1,0,1)
var line_width:float = 4.0 
var anti_alising:bool = false


func _ready():
	pass
func _physics_process(_delta):
	CrosshairPosition()
	queue_redraw()

	pass

func CrosshairPosition()->void:
	cross_hair.position = get_global_mouse_position()
	pass

	
func _draw():
	if Input.is_action_pressed("fire2"):
		draw_line(bullet_starting.get_global_position(), get_global_mouse_position(), color, line_width, anti_alising)

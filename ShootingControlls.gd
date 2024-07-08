extends Node2D

@onready var cross_hair = get_node("CrosshairSprite")

func _ready():
	pass

func _process(_delta):
	CrosshairPosition()
	ShootMode()

	pass

func CrosshairPosition():
	cross_hair.position = get_global_mouse_position()
	pass

	
func ShootMode():
	if Input.is_action_pressed("fire2"):
		# quiero que aparesca una linea entre el jugador y el crosshair
		pass

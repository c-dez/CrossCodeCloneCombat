extends Node2D

@onready var cross_hair = get_node("CrosshairSprite")

func _ready():
	cross_hair.visible = false

func _process(_delta):
	ShootMode()

	pass

func CrosshairPosition():
	cross_hair.position = get_global_mouse_position()
	pass

	
func ShootMode():
	if Input.is_action_pressed("fire2"):
		# quiero que aparesca una linea entre el jugador y el crosshair
		pass

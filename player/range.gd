extends Node2D


@onready var cross_hair = get_node("CrossHair")

func _ready():
	pass # Replace with function body.


func _process(delta):
	CrossHairPosition()
	queue_redraw()
	pass

func CrossHairPosition():
	cross_hair.global_position = get_global_mouse_position()
	
func _draw():
# aim
	if PlayerInputsClass.Mouse_Button_Right_Pressed():
		draw_line(position,cross_hair.position,Color(1,1,1,1),1)
	

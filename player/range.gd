extends Node2D


@onready var cross_hair = get_node("CrossHair")

func _ready():
	pass # Replace with function body.


func _physics_process(_delta:float)->void:
	cross_hair_position()
	queue_redraw()
	pass

func cross_hair_position()->void:
	cross_hair.global_position = get_global_mouse_position()
	
func _draw()->void:
	draw_aim_line()
	
	
func draw_aim_line()->void:
	if PlayerInputsClass.Mouse_Button_Right_Pressed():
		draw_line(position,cross_hair.position,Color(1,1,1,1),1)

extends Node2D

# instanciar bullet_rigid
@onready var bullet_rb = preload("res://scenes/bullet_rigid.tscn")
@onready var cross_hair := get_node("CrossHair")

func _ready():
	pass # Replace with function body.


func _physics_process(_delta:float)->void:
	cross_hair_position()
	queue_redraw()
	shoot_bullet()
	pass

func cross_hair_position()->void:
	cross_hair.global_position = get_global_mouse_position()
	
func _draw()->void:
	draw_aim_line()
	
	
func draw_aim_line()->void:
	if PlayerInputsClass.Mouse_Button_Right_Pressed():
		draw_dashed_line(position,cross_hair.position,Color(1,1,1,1),5,30, false)

func shoot_bullet():
	if PlayerInputsClass.Mouse_Button_Right_Pressed() and PlayerInputsClass.Mouse_Button_Left_Just_Pressed():
		var target_pos := get_global_mouse_position() - global_position
		var a = bullet_rb.instantiate()
		a.target_pos = get_global_mouse_position() - global_position
		add_child(a)
		#a.look_at(get_global_mouse_position())
		a.position = global_position
	 

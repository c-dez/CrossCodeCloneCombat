extends Node2D

# instanciar bullet_rigid
@onready var bullet_rb := preload("res://scenes/bullet_rigid.tscn")
@onready var cross_hair := get_node("CrossHair")

# charge timer
var charge_time:float = 1
var charge_time_internal:float = charge_time

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	cross_hair_position()
	charge_countdown(_delta)
	
	
func _physics_process(_delta:float)->void:
	queue_redraw()
	aim_and_shoot()
	
	pass

func cross_hair_position()->void:
	cross_hair.global_position = get_global_mouse_position()
	
func _draw()->void:
	draw_aim_line()
	pass
	
func draw_aim_line()->void:
# TODO cuando se esta apuntando reducir velocidad de movimiento de jugador

	if PlayerInputsClass.Mouse_Button_Right_Pressed():
		draw_dashed_line(position,cross_hair.position,Color(1,1,1,1),5,30, false)
		

func aim_and_shoot()->void:
	if PlayerInputsClass.Mouse_Button_Right_Pressed() and PlayerInputsClass.Mouse_Button_Left_Just_Pressed():
		var target_pos:Vector2 = get_global_mouse_position() - global_position
		var a := bullet_rb.instantiate()
		a.target_pos = target_pos
		add_child(a)
		a.position = global_position
		
func charge_countdown(_delta):
# esta funcion se encarga de cargar un spell mas poderoso
	
# asigna internal al valor charge timer al presionar aim
	if PlayerInputsClass.mouse_button_right_just_pressed():
		charge_time_internal = charge_time
# si aim esta presionado y internal es mayor que cero : empieza cuenta regresiva
	if PlayerInputsClass.Mouse_Button_Right_Pressed() and charge_time_internal > 0:
		charge_time_internal -=_delta
# cuando internal es menor que cero boom e internal = 0
		if charge_time_internal < 0:
			print("boom")
			charge_time_internal = 0
# si mientras se mantiene presionado aim y se presiona attack internal se resetea
	if PlayerInputsClass.Mouse_Button_Right_Pressed() and PlayerInputsClass.Mouse_Button_Left_Just_Pressed():
		charge_time_internal = charge_time
	pass	

	 


extends Node2D

# instanciar bullet_rigid
@onready var bullet_rb := preload("res://scenes/bullet_rigid.tscn")
@onready var cross_hair := get_node("CrossHair")

# charge timer
var charge_time:float = 1
var charge_time_internal:float = charge_time
var bullet_damage_mult:float = 1
var mult:float = 1.25
# draw line
var color := Color(1,1,1,1)

func _ready() -> void:
	pass
	
func _process(_delta:float) -> void:
	cross_hair_position()
	charge_countdown(_delta)
	pass
	
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
	if Input.is_action_pressed(PlayerInputsClass.keys_map.aim):
		draw_dashed_line(position,cross_hair.position,color,5,30, false)
	pass
		
	
func aim_and_shoot()->void:
# TODO cuando se esta apuntando reducir velocidad de movimiento de jugador
	
	if Input.is_action_pressed(PlayerInputsClass.keys_map.aim) and Input.is_action_just_pressed(PlayerInputsClass.keys_map.attack):
		var target_pos:Vector2 = get_global_mouse_position() - global_position
		var a := bullet_rb.instantiate()
		a.target_pos = target_pos
		add_child(a)
		a.position = global_position
		a.damage *= bullet_damage_mult
	pass
	
		
func charge_countdown(_delta:float)->void:
# esta funcion se encarga de cargar un spell mas poderoso
# asigna internal al valor charge timer al presionar aim
	if Input.is_action_just_pressed(PlayerInputsClass.keys_map.aim):	
		charge_time_internal = charge_time
# si aim esta presionado y internal es mayor que cero : empieza cuenta regresiva
	if Input.is_action_pressed(PlayerInputsClass.keys_map.aim) and charge_time_internal > 0:
		charge_time_internal -= _delta
# cuando internal es menor que cero boom e internal = 0
		if charge_time_internal < 0:
#spell charged
			color = Color(1,0,0,1)
			print("boom")
			# boom code block goes here
			bullet_damage_mult = mult
			charge_time_internal = 0
# si mientras se mantiene presionado aim y se presiona attack, internal se resetea
	if Input.is_action_pressed(PlayerInputsClass.keys_map.aim) and Input.is_action_just_released(PlayerInputsClass.keys_map.attack) or Input.is_action_just_released(PlayerInputsClass.keys_map.aim):
#spell discharge
		charge_time_internal = charge_time
		color = Color(1,1,1,1)
		bullet_damage_mult = 1
	pass	

	 


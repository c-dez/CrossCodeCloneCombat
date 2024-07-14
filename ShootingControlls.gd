extends Node2D

@onready var player = get_node("../Player")

# damageNumbers class
@onready var damage_numbers := DamageNumbers.new()
# keybidings class
@onready var player_inputs = PlayerInputs.new()

# shooting
@onready var cross_hair = get_node("CrosshairSprite")
@onready var shoot_position = get_node("../Player/BulletArm/BulletStartingPoint")
@onready var new_bullet: = preload("res://scenes/bullet.tscn")


# parametros drawn_line() NOT IN USE
var color:Color = Color(0,1,0, 0.3)
var line_width:float = 4.0 
var anti_alising:bool = false

# melee_hutBox
@onready var melee_hutBox:Area2D = get_node("Area2D")


# TODO: EL NOMBRE DE ESTE SCRIPT DEBERIA SER ATTACK CONTROLS O ALGO ASI, QUE ESTE SCRIPT NO SOLO CONTROLA SHOOTING, TAMBIEN MELEE DAMAGE

func _physics_process(delta):
	CrosshairPosition()
	queue_redraw()
	Aim_And_Shoot(delta)
	Melee_Attack()
	pass

func Melee_Attack()->void:
	# melee hurtbox debe de estar enfrente de el personaje o mirar al mouse global position? solo con gameplay testing puedo estar seguro

	# MELEE HURTBOX MIRA A MOUSE GLOBAL POSITION
	
	melee_hutBox.global_position = shoot_position.global_position
	melee_hutBox.look_at(cross_hair.position)
	if player_inputs.Mouse_Button_1_Just_Pressed() and !player_inputs.Mouse_Button_2_Pressed():
		melee_hutBox.monitoring = true
		var area:Array = melee_hutBox.get_overlapping_areas()
		for item in area.size():
			area[item].get_parent().get_node("EnemyLogic").Damage(damage_numbers.melee_base_damage)
			print(area[item].get_parent().name, " recives melee damage: ", damage_numbers.melee_base_damage)
	pass


func Aim_And_Shoot(_delta)->void:
	if player_inputs.Mouse_Button_1_Just_Pressed() and player_inputs.Mouse_Button_2_Pressed():
		var bullet_instance := new_bullet.instantiate()
		shoot_position.add_child(bullet_instance)
		bullet_instance.position = shoot_position.get_global_position()
		bullet_instance.velocity = get_global_mouse_position() - bullet_instance.position
		bullet_instance.direction = get_global_mouse_position()
		bullet_instance.look_at(get_global_mouse_position())
	pass


func CrosshairPosition()->void:
	cross_hair.position = get_global_mouse_position()
	pass

	
func _draw()->void:
	var pos:Vector2 = cross_hair.position
	if player_inputs.Mouse_Button_2_Pressed():
		draw_line(shoot_position.get_global_position(), pos  , color, line_width, anti_alising)

	# draw_line(Vector2(300,300), Vector2(500,500),color)
	# draw_line(Vector2(300,300), Vector2(700,700),Color(3,0,0,1))

	# draw_line(shoot_position.get_global_position(),get_global_mouse_position(), color)



extends Node2D

@onready var player = get_node("../Player")

# shooting
@onready var cross_hair = get_node("CrosshairSprite")
@onready var shoot_position = get_node("../Player/BulletArm/BulletStartingPoint")
@onready var new_bullet: = preload("res://scenes/bullet.tscn")
var bullet_speed:int = 200

# melee
var melee_damage:int = 25

# parametros drawn_line() NOT IN USE
var color:Color = Color(0,1,0, 0.3)
var line_width:float = 4.0 
var anti_alising:bool = false

# melee_hutBox
@onready var melee_hutBox:Area2D = get_node("Area2D")


func _physics_process(delta):
	CrosshairPosition()
	queue_redraw()
	Aim_And_Shoot(delta)
	Melee_Attack()
	pass

func Melee_Attack()->void:
	melee_hutBox.global_position = shoot_position.global_position
	melee_hutBox.look_at(cross_hair.position)
	if Input.is_action_just_pressed("fire1") and !Input.is_action_pressed("fire2"):
		melee_hutBox.monitoring = true
		var area = melee_hutBox.get_overlapping_areas()
		for item in area.size():
			area[item].get_parent().get_node("EnemyLogic").Damage(melee_damage)
	
	pass


func Aim_And_Shoot(_delta)->void:
	if Input.is_action_just_pressed("fire1") and Input.is_action_pressed("fire2"):
		var b = new_bullet.instantiate()
		shoot_position.add_child(b)
		b.position = shoot_position.get_global_position()
		b.velocity = get_global_mouse_position() - b.position
		b.direction = get_global_mouse_position()
		b.look_at(get_global_mouse_position())

		# no estoy satisfecho con que la bala se mueva a distintas velocidades segun la distancia de crosshair
	pass


func CrosshairPosition()->void:
	cross_hair.position = get_global_mouse_position()
	pass

	
func _draw()->void:
	var pos:Vector2 = cross_hair.position
	if Input.is_action_pressed("fire2"):
		draw_line(shoot_position.get_global_position(), pos  , color, line_width, anti_alising)

	# draw_line(Vector2(300,300), Vector2(500,500),color)
	# draw_line(Vector2(300,300), Vector2(700,700),Color(3,0,0,1))

	# draw_line(shoot_position.get_global_position(),get_global_mouse_position(), color)



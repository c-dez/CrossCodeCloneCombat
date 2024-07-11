extends Node2D

@onready var cross_hair = get_node("CrosshairSprite")
@onready var player = get_node("../Player")

@onready var shoot_position = get_node("../Player/BulletArm/BulletStartingPoint")

# shooting
@onready var new_bullet: = preload("res://scenes/bullet.tscn")
var bullet_speed:int = 200

# parametros drawn_line()
var color:Color = Color(0,1,0, 0.3)
var line_width:float = 4.0 
var anti_alising:bool = false

# testing area2d
@onready var area2d:Area2D = get_node("Area2D")


func _ready():
	
	pass


func _physics_process(delta):
	CrosshairPosition()
	queue_redraw()
	Aim_And_Shoot(delta)
	Melee_Attack()
	

func Melee_Attack():
	area2d.global_position = shoot_position.global_position
	area2d.look_at(cross_hair.position)
	if Input.is_action_just_pressed("fire1") and !Input.is_action_pressed("fire2"):
		area2d.monitoring = true
		print("true")
	else:
		area2d.monitoring = false
		print("false")

func Aim_And_Shoot(_delta)->void:
	if Input.is_action_just_pressed("fire1") and Input.is_action_pressed("fire2"):
		var b = new_bullet.instantiate()
		shoot_position.add_child(b)
		b.position = shoot_position.get_global_position()
		b.velocity = get_global_mouse_position() - b.position
		b.direction = get_global_mouse_position()
		b.look_at(get_global_mouse_position())

		# la bala se mueve a distintas velocidades segun el global mouse, tal vez pueda darle un clamp() para max y min speed
		# tambien podria hardcode velocity y en la bala look at() para que se dispare hacia esa posicion
	pass


func CrosshairPosition()->void:
	cross_hair.position = get_global_mouse_position()
	# var pos:Vector2 = get_global_mouse_position()
	
	pass

	
func _draw()->void:
	var pos:Vector2 = cross_hair.position

	# draw_line(Vector2(300,300), Vector2(500,500),color)
	# draw_line(Vector2(300,300), Vector2(700,700),Color(3,0,0,1))

	# draw_line(shoot_position.get_global_position(),get_global_mouse_position(), color)


	if Input.is_action_pressed("fire2"):
		draw_line(shoot_position.get_global_position(), pos  , color, line_width, anti_alising)

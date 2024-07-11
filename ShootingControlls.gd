extends Node2D

@onready var cross_hair = get_node("CrosshairSprite")
@onready var player = get_node("../Player")

@onready var bullet_starting = get_node("../Player/BulletArm/BulletStartingPoint")

# shooting
@onready var new_bullet: = preload("res://scenes/bullet.tscn")
var bullet_speed:int = 200

# parametros drawn_line()
var color:Color = Color(0,1,0,1)
var line_width:float = 4.0 
var anti_alising:bool = false


func _ready():
	pass
func _physics_process(delta):
	CrosshairPosition()
	queue_redraw()
	Aim_And_Shoot(delta)
	

	
		

	pass

func Aim_And_Shoot(delta):
	if Input.is_action_just_pressed("fire1") and Input.is_action_pressed("fire2"):
		var b = new_bullet.instantiate()
		bullet_starting.add_child(b)
		b.position = bullet_starting.get_global_position()
		b.velocity = get_global_mouse_position() - b.get_global_position() 
		b.velocity *= bullet_speed * delta
		b.velocity.normalized()

		# la bala se mueve a distintas velocidades segun el global mouse, tal vez pueda darle un clamp() para max y min speed
	pass


func CrosshairPosition()->void:
	cross_hair.position = get_global_mouse_position()
	pass

	
func _draw():
	if Input.is_action_pressed("fire2"):
		draw_line(bullet_starting.get_global_position(), get_global_mouse_position(), color, line_width, anti_alising)

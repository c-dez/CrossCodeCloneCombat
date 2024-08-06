extends RigidBody2D

var speed:int = 30
var target_pos := Vector2.ZERO
var timer := Timer.new()
var angle:float
var time_start:float = 5
var damage:int = 50

@onready var collision := get_node("Area2D")


func _ready() -> void:
	top_level = true
	angle = atan2(target_pos.y, target_pos.x)
	rotation = angle
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	timer.start(time_start)
	
	
func _physics_process(_delta: float) -> void:
# ESTO RESUELVE EL PROBLEMA QUE TENIA CON LA VELOCIDAD DE LA BALA SEGUN LA DISTANCIA A LA QUE SE DISPARA
# con move and collide el vector que le doy de parametro es el angulo(atan2) de la pocicion global de el mouse multiplicado por la velocidad a la que quiero que la bala se mueva
	move_and_collide(Vector2.from_angle(angle).normalized() * speed)
	do_damage()
	
	
func do_damage()->void:
	var areas:Array = collision.get_overlapping_bodies()
	# collision 4
	for i:int in areas.size():
		if "do_damage" in areas[i]:
			areas[i].do_damage(damage)
			queue_free()
	
	
func _on_timer_timeout():
	queue_free()
	

extends RigidBody2D

var speed: = 20
var target_pos := Vector2.ZERO
var timer := Timer.new()
var angle:float
var time_out:float = 5


func _ready() -> void:
	top_level = true
	angle = atan2(target_pos.y, target_pos.x)
	rotation = angle
	add_child(timer)
	timer.timeout.connect(_on_timer_timeout)
	timer.start(time_out)
	
	
func _physics_process(_delta: float) -> void:
#	ESTO RESUELVE EL PROBLEMA QUE TENIA CON LA VELOCIDAD DE LA BALA SEGUN LA DISTANCIA A LA QUE SE DISPARA
# con move and collide el vector que le doy de parametro es el angulo(atan2) de la pocicion global de el mouse multiplicado por la velocidad a la que quiero que la bala se mueva
	move_and_collide(Vector2.from_angle(angle) * speed)
	pass

func _on_timer_timeout():
	queue_free()
	print("free")

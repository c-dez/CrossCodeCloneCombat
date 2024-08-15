extends CharacterBody2D


@onready var player := get_node("../Player")
@export var life:int = 100
@export var speed:int = 100



func _physics_process(_delta:float)->void:
	velocity = player.global_position - global_position
	speed_clamp(velocity, speed)
	move_and_slide()
	

func do_damage(_damage:int)->void:
	life -= _damage
	if life <= 0 :
		queue_free()
		print(name , " died")
	else:
		print(name," ", life, " life")
		
func do_melee_damage():
	print("melee ", name)
		
		
	
func speed_clamp(_velocity:Vector2, _speed:int)->Vector2:
# creo que hay un metodo que hace esto
	if _velocity.x < 0:
		_velocity.x = clamp(_velocity.x,-_speed, -_speed)
	if _velocity.x > 0:
		_velocity.x = clamp(_velocity.x,_speed, _speed)
	if _velocity.y < 0:
		_velocity.y = clamp(_velocity.y,-_speed, -_speed)
	if _velocity.y > 0:
		_velocity.y = clamp(_velocity.y,_speed ,_speed)
	_velocity.normalized()
	return _velocity
		




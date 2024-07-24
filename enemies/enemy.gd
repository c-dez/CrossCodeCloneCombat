extends CharacterBody2D


@onready var player := get_node("../Player")
var life:int = 100
var speed:int = 100


func _physics_process(_delta:float)->void:
	velocity = player.global_position - global_position
	velocity = EnemyLogicClass.base_stats.velocity_clamp(velocity, speed)
	velocity.normalized()
	move_and_slide()
	

func do_damage(_damage:int)->void:
	life -= _damage
	if life <= 0 :
		queue_free()
		print(name , " died")
	else:
		print(name," ", life, " life")
		
		
	
	




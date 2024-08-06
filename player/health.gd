extends Node


var max_health:int = BaseStatsClass.max_life
var current_health:int

@onready var player = get_node("..")

func _ready() -> void:
	current_health = max_health
	
func _physics_process(_delta: float) -> void:
	you_died()

func you_died()->void:
	if current_health <= 0:
		print("you died")




func _on_hurtbox_body_entered(body: Node2D) -> void:
	
	body.do_melee_damage()
	
	pass # Replace with function body.

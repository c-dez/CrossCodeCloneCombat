extends Node


var max_health:int = 100
var current_health:int

func _ready() -> void:
	current_health = max_health
	
	
func you_died()->void:
	if current_health <= 0:
		print("you died")

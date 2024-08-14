extends Area2D

@onready var collision:CollisionShape2D = get_node("CollisionShape2D")
#@onready var brain:Node = get_node("../Brain")

func _ready() -> void:
	collision.debug_color = Color(1,0,0,0.5)
	



func melee_damage():
	print("enemy hurtbox")
	pass

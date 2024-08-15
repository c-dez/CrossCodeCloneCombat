extends Area2D

@onready var collision:CollisionShape2D = get_node("CollisionShape2D")

func _ready() -> void:
	collision.debug_color = Color(1,0,0,0.5)
	pass	



func melee_damage():
	print("enemy hurtbox")
	pass

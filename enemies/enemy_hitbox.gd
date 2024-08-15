extends Area2D

@onready var collision := get_node("CollisionShape2D")
var collision_color_green := Color(0,1,0,0.5)

@onready var parent := get_node("..")

const ID:String = "enemy"

func _ready() -> void:
	collision.debug_color = collision_color_green
	pass

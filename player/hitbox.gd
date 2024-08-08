extends Area2D

@onready var collision := get_node("CollisionShape2D")
#invisibility frames
@onready var inv_frames_timer:= Timer.new()
var inv_frames_cd:float = 3.0


func _ready() -> void:
	collision.debug_color = Color(0,1,0,0.5)
	add_child(inv_frames_timer)
	
	
func _process(_delta: float) -> void:
	
	
	pass

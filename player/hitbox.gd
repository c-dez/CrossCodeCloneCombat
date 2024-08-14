extends Area2D

@onready var collision := get_node("CollisionShape2D")
var hit_box_color_green := Color(0,1,0,0.5)
#invisibility frames
@onready var inv_frames_timer:= Timer.new()
var inv_frames_cd:float = 3.0


func _ready() -> void:
	collision.debug_color = hit_box_color_green
	add_child(inv_frames_timer)
	inv_frames_timer.timeout.connect(_on_inv_frames_timeout)
	
	
	
func _physics_process(_delta: float) -> void:
	if monitoring == true:
		if has_overlapping_areas():
			var areas := get_overlapping_areas()
			for i in areas.size():
				if "melee_damage" in areas[i]:
					areas[i].melee_damage()
					monitoring = false
					inv_frames_timer.start(inv_frames_cd)
	
	pass

func _on_inv_frames_timeout():
	monitoring =true
	pass


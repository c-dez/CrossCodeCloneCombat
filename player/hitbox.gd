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
	pass
	
	
func _physics_process(_delta: float) -> void:
	hitbox_behhavior()
	pass
	
func hitbox_behhavior()->void:
	if monitoring == true:
		if has_overlapping_areas():
			var areas:Array = get_overlapping_areas()
			var filter_area:Array = []
			for i in areas.size():
				if "melee_damage" in areas[i]:
					filter_area.append(areas[i])
					monitoring = false
					visible = false
			if "melee_damage" in filter_area[0]:
				filter_area[0].melee_damage()
				inv_frames_timer.start(inv_frames_cd)
				
				
func _on_inv_frames_timeout()->void:
	monitoring =true
	visible = true
	pass


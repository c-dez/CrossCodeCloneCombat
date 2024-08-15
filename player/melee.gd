extends Area2D

# TODO: ESTE VALOR ESTA HARDCODE QUIERO CENTRALIZAR ESTOS VALORES
var damage:int = 30
# TODO COOLDOWN, ANIMACION

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed(PlayerInputsClass.keys_map.attack) and !Input.is_action_just_pressed(PlayerInputsClass.keys_map.aim):		
		var areas:Array = get_overlapping_areas()
		for i:int in areas.size():
			if "ID" in areas[i]:
				if areas[i].ID == "enemy":
					areas[i].parent.do_damage(damage)
	pass
	

extends Area2D

# TODO: ESTE VALOR ESTA HARDCODE QUIERO CENTRALIZAR ESTOS VALORES
# TODO COOLDOWN, ANIMACION
var damage:int = 30

func _physics_process(_delta: float) -> void:
	if PlayerInputsClass.Mouse_Button_Left_Just_Pressed() and !PlayerInputsClass.Mouse_Button_Right_Pressed():
		var areas = get_overlapping_bodies()
		for i in areas.size():
			if areas[i].has_method("do_damage"):
				areas[i].do_damage(damage)
	pass
	

extends Area2D

# TODO: ESTE VALOR ESTA HARDCODE QUIERO CENTRALIZAR ESTOS VALORES
var damage:int = 30
# TODO COOLDOWN, ANIMACION

func _physics_process(_delta: float) -> void:
	if PlayerInputsClass.Mouse_Button_Left_Just_Pressed() and !PlayerInputsClass.Mouse_Button_Right_Pressed():
		var areas:Array = get_overlapping_bodies()
		for i:int in areas.size():
			if "do_damage" in areas[i]:
				areas[i].do_damage(damage)
	pass
	

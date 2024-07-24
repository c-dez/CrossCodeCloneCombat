extends Area2D

@onready var damage = 30

func _physics_process(delta: float) -> void:
	if PlayerInputsClass.Mouse_Button_Left_Just_Pressed() and !PlayerInputsClass.Mouse_Button_Right_Pressed():
		var areas = get_overlapping_bodies()
		for item in areas.size():
			if areas[item].has_method("do_damage"):
				areas[item].do_damage(damage)
			
	pass
	

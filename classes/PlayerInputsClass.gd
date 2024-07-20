class_name PlayerInputs
extends Node

# movement
var direction_map:Dictionary = {
	"left":"left",
	"right":"right",
	"up":"up",
	"down":"down"
}

# buttons
var keys_map:Dictionary = {
	"dash": "space",
	"attack": "fire1",
	"aim": "fire2",
}

func Move_Direction_Vector()->Vector2:
	var direction:Vector2
	direction = Input.get_vector(direction_map.left,direction_map.right,direction_map.up, direction_map.down)
	direction.normalized()
	return direction


func Space_key_Just_Pressed()->bool:
	if Input.is_action_just_pressed(keys_map.dash):
		return true
	else:
		return false


func Mouse_Button_Left_Just_Pressed()->bool:
	if Input.is_action_just_pressed(keys_map.attack):
		return true
	else:
		return false


func Mouse_Button_Right_Pressed()->bool:
	if Input.is_action_pressed(keys_map.aim):
		return true
	else:
		return false

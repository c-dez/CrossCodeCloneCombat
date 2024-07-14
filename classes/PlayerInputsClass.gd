class_name PlayerInputs
# movement
var left:String = "left"
var right:String = "right"
var up:String = "up"
var down:String = "down"
# buttons
var dash:String = "space"
var left_mouse_button:String = "fire1"
var right_mouse_button:String = "fire2"


func Move_Vector()->Vector2:
    var direction:Vector2
    direction = Input.get_vector(left,right,up, down)
    direction.normalized()
    return direction


func Space_key_Just_Pressed()->bool:
    if Input.is_action_just_pressed(dash):
        return true
    else:
        return false


func Mouse_Button_1_Just_Pressed()->bool:
    if Input.is_action_just_pressed(left_mouse_button):
        return true
    else:
        return false


func Mouse_Button_2_Pressed()->bool:
    if Input.is_action_pressed(right_mouse_button):
        return true
    else:
        return false
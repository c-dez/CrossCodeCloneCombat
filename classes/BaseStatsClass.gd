class_name BaseStats
extends Node

# stats para jugador, pensar si vale la pena expandirlo para npc o crear una clase aparte para ellos

var move_speed:int = 400
var move_speed_walk:int = 100
var max_life:int = 100
var life:int = 100
var dash_mult:int = 3
var dash_timer:float = 0.3
var dash_cooldown:float =  0.5

# TODO usado por Enemy cambiarlo de lugar
func velocity_clamp(_velocity:Vector2, _clamp_number:int):
	if _velocity.x < 0:
		_velocity.x = clamp(_velocity.x,-_clamp_number, -_clamp_number)
	if _velocity.x > 0:
		_velocity.x = clamp(_velocity.x,_clamp_number, _clamp_number)
	if _velocity.y < 0:
		_velocity.y = clamp(_velocity.y,-_clamp_number, -_clamp_number)
	if _velocity.y > 0:
		_velocity.y = clamp(_velocity.y,_clamp_number ,_clamp_number)
	_velocity.normalized()
	return _velocity

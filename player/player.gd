extends CharacterBody2D

@onready var pivot := get_node("Pivot")

#dash
@onready var dash_coold_down_timer := Timer.new()
var dashing_time:float = 0
var dash_mult:int = 1
var can_dash:bool = true


func _ready()->void:
	add_child(dash_coold_down_timer)
	dash_coold_down_timer.timeout.connect(_on_timer_out_dash_cooldown)
	pass

func _physics_process(delta:float)->void:
	Move()
	Dash(delta)           
	BulletArm_Look_At()
	Debug()

	# TODO: EL HITBOX MIRA HACIA EL MOUSE, QUIERO QUE MIRE HACIA DONDE EL JUGADOR SE MUEVE?
	pass

func BulletArm_Look_At()->void:
	pivot.look_at(get_global_mouse_position())
	pass


func Dash(delta:float)->void:
	if PlayerInputsClass.Space_key_Just_Pressed() and can_dash:
		# al presionar space, inicia una cuenta regresiva, mientras este corriendo esta cuenta, el multiplicador de dash se incrementa y cuando termina la cuenta regresiva multiplicador dash regresa a default que es 1
		dashing_time = BaseStatsClass.dash_timer
		#  dash cool down dashing_time empieza a correr y can dash = false
		#  al termonar cool down dashing_time can dash = true
		dash_coold_down_timer.start(BaseStatsClass.dash_cooldown)
		can_dash = false
	if dashing_time > 0:
		dashing_time -= delta
		dash_mult = BaseStatsClass.dash_mult
	elif dashing_time < 0:
		dash_mult = 1
		dashing_time = 0
	pass
	

func _on_timer_out_dash_cooldown()->void:
	can_dash = true
	pass

func Move()->void:
	if PlayerInputsClass.Move_Direction_Vector() != Vector2.ZERO:
		velocity = PlayerInputsClass.Move_Direction_Vector() * BaseStatsClass.move_speed * dash_mult
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	pass


func Debug():
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	pass

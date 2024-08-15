extends CharacterBody2D

@onready var pivot := get_node("Pivot")

#dash
@onready var dash_coold_down_timer := Timer.new()
var dashing_time:float = 0
var dash_mult:int = 1
var can_dash:bool = true

#debugging
@onready var ui = get_node("ui")
@onready var health_node = get_node("Health")

# hurtbox
@onready var player_hitbox := get_node("player_hitbox")


func _ready()->void:
	add_child(dash_coold_down_timer)
	dash_coold_down_timer.timeout.connect(_on_timer_out_dash_cooldown)

	pass

func _physics_process(delta:float)->void:
	Move()
	Dash(delta)           
	pivot_look_at()
	Debug()

	# TODO: EL HITBOX MIRA HACIA EL MOUSE, QUIERO QUE MIRE HACIA DONDE EL JUGADOR SE MUEVE?
	pass



func pivot_look_at()->void:
	var mouse_pos:Vector2 = get_global_mouse_position()
	pivot.look_at(mouse_pos)
	pass


func Dash(delta:float)->void:
	if Input.is_action_just_pressed(PlayerInputsClass.keys_map.dash) and can_dash:
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
# se invoca en dash()
	can_dash = true
	pass


func Move()->void:
	var direction:Vector2 = PlayerInputsClass.Move_Direction_Vector()
	if direction != Vector2.ZERO:
		velocity = direction * BaseStatsClass.move_speed * dash_mult
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	pass


func Debug():
# TODO: borrar
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
	# simula player recibiendo dano	
	if Input.is_action_just_pressed("test"):
# tecla "T"
		pass
	pass

extends CharacterBody2D

# stats son asignados desde la clase classes/BaseStatsClass.gd
@onready var base_stats:BaseStats = BaseStats.new()
@onready var bullet_arm := get_node("BulletArm")

var timer:float = 0
var dash_mult:int = 1

# keybindings
@onready var player_inputs := PlayerInputs.new()


func _physics_process(delta:float):
    Move()
    Dash(delta)           
    BulletArm_Look_At()

    Debug()

    # considerar usar state machine para dash, tambien se me ocurre que para efectos como slow o  caminar en hielo pueden beneficiarse de state machines
    
    # TODO: EL HITBOX MIRA HACIA EL MOUSE, QUIERO QUE MIRE HACIA DONDE EL JUGADOR SE MUEVE
    # TODO: CREAR UNA CLASE PARA TODOS LOS INPUTS DE EL JUGADOR, PARA NO TENER CADA UNO ESPARCIDO ENTRE SCRIPTS

    pass

func BulletArm_Look_At()->void:
    bullet_arm.look_at(get_global_mouse_position())
    pass

func Dash(delta:float)->void:

    # TODO: PONER UN COOLDOWN DEPUES DE USAR DASH CONSECUTIVOS , PARA EVITAR SPAM
    # TODO: EL TIMER DE CUENTA REGRESIVA HACERLO UN METODO GLOBAL, EN UNA CLASES


    if player_inputs.Space_key_Just_Pressed():
        # al presionar space, inicia una cuenta regresiva, mientras este corriendo esta cuenta, el multiplicador de dash se incrementa y cuando termina la cuenta regresiva multiplicador dash regresa a default que es 1
        timer = base_stats.dash_timer
    if timer > 0:
        timer -= delta
        dash_mult = base_stats.dash_mult
    elif timer < 0:
        dash_mult = 1
        timer = 0
    pass


func Move()->void:
    if player_inputs.Move_Vector() != Vector2.ZERO:
        velocity = player_inputs.Move_Vector() * base_stats.move_speed * dash_mult
    else:
        velocity = Vector2.ZERO
    move_and_slide()
    pass












func Debug():
    if Input.is_action_just_pressed("quit"):
        get_tree().quit()
    pass
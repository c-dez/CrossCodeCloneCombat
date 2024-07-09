extends CharacterBody2D

# stats son asignados desde la clase classes/BaseStatsClass.gd
@onready var base_stats:BaseStats = BaseStats.new()
@onready var move_speed:int = base_stats.move_speed

var timer = 0
var dash_mult = 1


func _physics_process(delta):
    Debug()
   
    Dash(delta)           
    Move()


    # considerar usar state machine para dash, tambien se me ocurre que para efectos como slow o  caminar en hielo pueden beneficiarse de state machines

    pass

func Dash(delta)->void:

    #TODO: PONER UN COOLDOWN DEPUES DE USAR DASH CONSECUTIVOS , PARA EVITAR SPAM

    if Input.is_action_just_pressed("space"):
        # al presionar space, inicia una cuenta regresiva, mientras este corriendo esta cuenta, el multiplicador de dash se incrementa y cuando termina la cuenta regresiva multiplicador dash regresa a default que es 1
        timer = base_stats.dash_timer
    if timer > 0:
        timer -= delta
        dash_mult = base_stats.dash_mult
    elif timer < 0 :
        dash_mult = 1
        timer = 0
    pass

func Move()->void:
    var input:Vector2 = Input.get_vector("left","right", "up", "down").normalized()
    if input != Vector2.ZERO :
        velocity = input * move_speed *dash_mult
    else:
        velocity = Vector2.ZERO
    move_and_slide()
    pass












func Debug():
    if Input.is_action_just_pressed("quit"):
        get_tree().quit()
    pass
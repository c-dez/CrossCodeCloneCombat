extends CharacterBody2D

var start_time:int = 1
var direction = Vector2.ZERO
var speed =11

func _ready():
    top_level = true
    var timer:Timer = Timer.new()
    add_child(timer)
    timer.timeout.connect(_on_timer_out)
    timer.start(start_time)


func _physics_process(delta):
    # esto resuelve* el problema de que la bala se mueve a distintas velocidades segun lo cerca que mouse_global_osition este de el origen
    velocity *= 1.1

    move_and_collide(velocity *delta )



    pass

func _on_timer_out():
    queue_free()
    print("bullet destroyesd")
    pass
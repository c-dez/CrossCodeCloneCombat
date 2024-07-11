extends CharacterBody2D

var start_time:int = 5

func _ready():
    top_level = true
    var timer:Timer = Timer.new()
    add_child(timer)
    timer.timeout.connect(_on_timer_out)
    timer.start(start_time)

func _physics_process(delta):
    move_and_slide()
    print(velocity)


func _on_timer_out():
    queue_free()
    # print("bullet destroyesd")
    pass
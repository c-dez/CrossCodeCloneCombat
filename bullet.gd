extends CharacterBody2D

@onready var bullet_hurtBox:Area2D = get_node("Area2D")
@onready var base_stats:= BaseStats.new()

var start_time:int = 1
var direction = Vector2.ZERO
var speed =11

func _ready():
    top_level = true
    var timer:Timer = Timer.new()
    add_child(timer)
    timer.timeout.connect(_on_timer_out)
    timer.start(start_time)
    bullet_hurtBox.monitoring = true


func _physics_process(delta):
    # esto resuelve* el problema de que la bala se mueve a distintas velocidades segun lo cerca que mouse_global_osition este de el origen
    velocity *= 1.1


    move_and_collide(velocity *delta )

    var area:Array = bullet_hurtBox.get_overlapping_areas()
    
    for item in area.size():
        if area[item].get_parent().get_node("EnemyLogic"):
            area[item].get_parent().get_node("EnemyLogic").Damage(base_stats.bullet_damage)
            queue_free()
            print(area[item].name, " damage: ", base_stats.bullet_damage)
        # else:
        #     print(area[item].name)


    pass

func _on_timer_out():
    queue_free()
    print("bullet destroyesd")
    pass
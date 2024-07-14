extends CharacterBody2D

@onready var bullet_hurtBox:Area2D = get_node("Area2D")

#  damage numbers class
@onready var damage_numbers: = DamageNumbers.new()

var start_time:int = 3
var direction = Vector2.ZERO


func _ready():
    top_level = true
    var timer:Timer = Timer.new()
    add_child(timer)
    timer.timeout.connect(_on_timer_out)
    timer.start(start_time)
    bullet_hurtBox.monitoring = true


func _physics_process(delta:float):

    # esto resuelve?* el problema de que la bala se mueve a distintas velocidades segun lo cerca que mouse_global_osition este de el origen
    velocity *= 1.1

    move_and_collide(velocity * delta )
    Do_Damage_To()
    pass


func Do_Damage_To():
    var area:Array = bullet_hurtBox.get_overlapping_areas()
    for item in area.size():
        if area[item].get_parent().get_node("EnemyLogic"):
            area[item].get_parent().get_node("EnemyLogic").Damage(damage_numbers.bullet_base_damage)
            print(area[item].get_parent().name, " recives bullet damage: ", damage_numbers.bullet_base_damage)
            queue_free()
    pass


func _on_timer_out():
    print("bullet timeout")
    queue_free()
    pass
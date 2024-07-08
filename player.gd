extends CharacterBody2D

@onready var base_stats:BaseStats = BaseStats.new()
@onready var move_speed:int = base_stats.move_speed

func _ready():
    pass

func _physics_process(delta):
    Move(delta)

    pass


func Move(_delta):
    var input:Vector2 = Input.get_vector("left","right", "up", "down").normalized()
    if input != Vector2.ZERO :
        velocity = input * move_speed
    else:
        velocity = Vector2.ZERO
    move_and_slide()


func Debug():
    pass
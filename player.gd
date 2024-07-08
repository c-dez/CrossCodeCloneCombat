extends CharacterBody2D

var speed:int = 300


func _physics_process(delta):
    Move(delta)

    pass


func Move(_delta):
    var input:Vector2 = Input.get_vector("left","right", "up", "down").normalized()
    if input != Vector2.ZERO :
        velocity = input * speed
    else:
        velocity = Vector2.ZERO
    move_and_slide()


func Debug():
    pass
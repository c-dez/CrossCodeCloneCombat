extends Node
class_name EnemyLogic

var life = 100

func _physics_process(delta):
    pass

func Damage(damage:int)->void:
    life -= damage
    print(life)
    if life <= 0:
        get_tree().queue_delete(get_parent())
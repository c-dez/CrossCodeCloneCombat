extends Node
class_name EnemyLogic

var life:int = 100

func _physics_process(_delta):
    pass

func Damage(damage:int)->void:
    life -= damage
    print(get_parent().name ," life: ", life)
    if life <= 0:
        get_tree().queue_delete(get_parent())
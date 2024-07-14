extends Node
class_name EnemyLogic


@onready var base_stats = BaseStats.new()
@onready var damage_numbres = DamageNumbers.new()

var life:int = 100

func _physics_process(_delta):
    pass

func Damage(damage:int)->void:
    life -= damage
    if life <= 0:
        get_tree().queue_delete(get_parent())
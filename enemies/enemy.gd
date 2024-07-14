extends CharacterBody2D

@onready var enemy_logic_node = get_node("EnemyLogic")
#player pos reference
@onready var player = get_node("../Player")

func _physics_process(delta:float):
    velocity = player.global_position - position

    # if velocity.x < 0:
    #     velocity.x = clamp(velocity.x,-50, -50)
    # if velocity.x > 0:
    #     velocity.x = clamp(velocity.x,50, 50)

    # if velocity.y < 0:
    #     velocity.y = clamp(velocity.y,-50, -50)
    # if velocity.y > 0:
    #     velocity.y = clamp(velocity.y,50 ,50)
    # # velocity *= delta

    velocity = enemy_logic_node.base_stats.velocity_clamp(velocity, 50)
    velocity.normalized()

    # print(velocity)
    move_and_slide()





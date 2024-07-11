extends RayCast2D

@onready var node = get_node("Node2D")

func _physics_process(delta):
	node.position = target_position.y

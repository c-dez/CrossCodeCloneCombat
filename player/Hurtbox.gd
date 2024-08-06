extends Area2D

@onready var collision := get_node("CollisionShape2D")
@onready var hurtbox_disable_timer := Timer.new()
var hurtbox_disable_cd:float = 3.0


func _ready() -> void:
	collision.debug_color = Color(0,1,0,0.5)
	# hutbox disable
	monitoring = true
	add_child(hurtbox_disable_timer)
	hurtbox_disable_timer.timeout.connect(_on_timeout_enable_hurtbox)
	
	
func _process(_delta: float) -> void:
	#if monitoring == true:
		#if has_overlapping_bodies():
			#var bodies = get_overlapping_bodies()
			#for i in bodies.size():
				#if "do_melee_damage" in bodies[i]:
					#monitoring = false
					#hurtbox_disable_timer.start(hurtbox_disable_cd)
					#body_entered.emit(bodies[i])
	if monitoring == true and has_overlapping_bodies():
		var bodies = get_overlapping_areas()
		for i in bodies.size():
			if "do_melee_damage" in bodies[i]:
				
				var damage_surce = bodies[i]
				monitoring = false
				hurtbox_disable_timer.start(hurtbox_disable_cd)
				body_entered.emit(damage_surce)  
				#PROBLEMA esta invocando do_melee_damage sin respetar el cd de desactivar monitoring		
					
			
	pass

func _on_timeout_enable_hurtbox():
	monitoring = true

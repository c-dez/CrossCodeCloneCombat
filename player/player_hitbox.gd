extends Area2D

@onready var collision := get_node("CollisionShape2D")
var collision_color_green := Color(0,1,0,0.5)
#invisibility frames
@onready var inv_frames_timer:= Timer.new()
# tiempo en segundos de invicibilidad
@export var inv_frames_cd:float = 3.0


func _ready() -> void:
	collision.debug_color = collision_color_green
	add_child(inv_frames_timer)
	inv_frames_timer.timeout.connect(_on_inv_frames_timeout)
	pass
	
	
func _physics_process(_delta: float) -> void:
	hitbox_behhavior()
	pass
	
	
func hitbox_behhavior()->void:
	if monitoring == true:
		if has_overlapping_areas():
			var areas:Array = get_overlapping_areas()
			var filter_areas:Array = []
			for i in areas.size():
				if "melee_damage" in areas[i]:
					# si existe metodo "melee_damage" hace loop y agrega cada uno a filter_areas:array, desactiva monitoring y visible para no detectar mas
					filter_areas.append(areas[i])
					monitoring = false
					visible = false
			if "melee_damage" in filter_areas[0]:
				# si melee_damage existe en filter_areas[0], invoca este metodo y comienza cuenta regresiva, al terminar la cuenta regresiva, monitoring y visible se activan
				filter_areas[0].melee_damage()
				inv_frames_timer.start(inv_frames_cd)
			
			# puedo expandir los metodos que se invocan, pero tienen que seguir orden de ejecucion y solo uno puede ser ejecutado
			
			# TENER CUIDADO CON ERRORES, ESTOY USANDO DUCK TYPING!
	pass
				
				
func _on_inv_frames_timeout()->void:
	# timer iniciado en hitbox_behavior()
	monitoring =true
	# para debug
	visible = true
	pass


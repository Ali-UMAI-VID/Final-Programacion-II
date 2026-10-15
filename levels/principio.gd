extends Node2D
@export var jugador : Player
@export var niveles : PackedScene

func _physics_process(delta):
	Globales.apagar_luz_sala = false
func _on_puerta_body_entered(body):
	if not body is Player: return
	get_tree().change_scene_to_packed(niveles)
	

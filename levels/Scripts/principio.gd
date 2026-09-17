extends Node2D
@export var jugador : Player
@export var nivel_1 : PackedScene
func _on_puerta_body_entered(body):
	if not body is Player: return
	get_tree().change_scene_to_packed(nivel_1)

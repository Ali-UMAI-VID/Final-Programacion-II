extends Node2D
var dentro_de_area : bool = false
@onready var sprite_puerta = $sprite_Puerta

@onready var cuerpo_puerta = $cuerpo_Puerta

func _physics_process(delta):
	if Input.is_action_just_pressed("accion") and dentro_de_area == true:
		print("e")
		sprite_puerta.play("Moviendose")
		cuerpo_puerta.queue_free()

func _on_area_puerta_area_entered(area):
	if area.is_in_group("Jugador"):
		print("anasje %s" % Globales.enemigo_matado)
		if Globales.enemigo_matado == true:
			dentro_de_area = true
			print("dentro")

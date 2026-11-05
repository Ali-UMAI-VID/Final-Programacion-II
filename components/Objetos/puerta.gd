extends Node2D
var dentro_de_area : bool = false

@export var numero_puerta : int = 0
@onready var sprite_puerta = $sprite_Puerta
@onready var cuerpo_puerta = $cuerpo_Puerta
@onready var area_puerta_animacion_luz = $area_puerta_animacion_luz


func _physics_process(delta):
	if Input.is_action_just_pressed("accion") and dentro_de_area == true:
		Globales.movimiento_lateral_activado = false
		sprite_puerta.play("Moviendose")
		await sprite_puerta.animation_finished
		Globales.movimiento_lateral_activado = true
		if cuerpo_puerta: cuerpo_puerta.queue_free()
		Globales.estado_nivel += 1
		print(Globales.estado_nivel)
		Globales.enemigo_matado = false
		dentro_de_area = false
		#print(Globales.estado_nivel)
		#print(Globales.enemigo_matado)

func _on_area_puerta_area_entered(area):
	if area.is_in_group("Jugador"):
		if Globales.enemigo_matado == true:
			if numero_puerta == Globales.estado_nivel:
				dentro_de_area = true


func _on_area_puerta_animacion_luz_area_entered(area):
	if area.is_in_group("Jugador"):
		Globales.animacion_sala = true
		Globales.cambio_posicion_camara = true
		area_puerta_animacion_luz.queue_free()

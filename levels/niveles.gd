extends Node2D
class_name Nivel

signal nivel_cambiado

@onready var animacion_sala_luz = $Animacion_Sala_Luz
@onready var gameplay_niveles = $"."
@onready var camera_sala_jug: Camera2D = $Jugador/Camera_Sala_jug
@onready var jugador = $Jugador

## Función que se ejecuta una solo vez al principio de la escena
func _ready():
	Globales.nodo_nivel = self
	Globales.animacion_sala = animacion_sala_luz
	print(Globales.nodo_nivel)
	Globales.estado_nivel += 1
	pasaje_de_nivel()

## Funcion que se ejecuta cuando hay un cambio de nivel
func pasaje_de_nivel():
	nivel_cambiado.emit()
	if Globales.estado_nivel == 1:
		camera_sala_jug.position.y -= 363.0
	if Globales.estado_nivel == 2:
		camera_sala_jug.position.y -= 1300.0
	if Globales.estado_nivel == 3:
		camera_sala_jug.position.y -= 1350.0
	if Globales.estado_nivel == 4:
		camera_sala_jug.position.y -= 3300.0

		
	camera_sala_jug.position.x = 1315.0
	animacion_sala_luz.play("Animacion_luz_inicial")
	camera_sala_jug.reparent(gameplay_niveles)
	camera_sala_jug.zoom.x = 1
	camera_sala_jug.zoom.y = 1
	#print(camera_sala_jug.position.x)
	#print(camera_sala_jug.position.y)
	Globales.movimiento_lateral_activado = false
	
	#Globales.apagar_luz_sala = true
	
	await animacion_sala_luz.animation_finished
	
	camera_sala_jug.reparent(jugador)
	camera_sala_jug.position.x = 0
	camera_sala_jug.position.y = 0
	camera_sala_jug.zoom.x = 3
	camera_sala_jug.zoom.y = 3
	Globales.movimiento_lateral_activado = true
	
	return

extends Node2D
class_name nivel
@onready var animacion_sala_luz : AnimationPlayer = $AnimacionSalaLuz
@onready var jugador = $Jugador
@onready var camera_sala_jug: Camera2D = $Jugador/CameraSala_jug
@onready var niveles = $"."


#@onready var mimico = $Mimico
#@export var velo_mimico = 150
var cambio_posicion_camara = false
func _ready():
	cambio_posicion_camara = true
	_sala_luz()
	Globales.animacion_sala = false
	Globales.estado_nivel += 1

func _process(delta):
	#print(Globales.animacion_sala)
	if Globales.animacion_sala == true and cambio_posicion_camara == true:
		_sala_luz()
		cambio_posicion_camara = false


func _sala_luz():
	
	if Globales.estado_nivel == 1:
		camera_sala_jug.position.y -= 363.0
	if Globales.estado_nivel == 2:
		camera_sala_jug.position.y -= 1300.0
	if Globales.estado_nivel == 3:
		camera_sala_jug.position.y -= 2300.0
	if Globales.estado_nivel == 4:
		camera_sala_jug.position.y -= 3300.0
		
	camera_sala_jug.position.x = 1315.0
	animacion_sala_luz.play("Animacion_luz_inicial")
	camera_sala_jug.reparent(niveles)
	camera_sala_jug.zoom.x = 1
	camera_sala_jug.zoom.y = 1
	print(camera_sala_jug.position.x)
	print(camera_sala_jug.position.y)
	Globales.movimiento_lateral_activado = false
	Globales.apagar_luz_sala = true
	Globales.movimientoEnemigo = true
	
	await animacion_sala_luz.animation_finished
	Globales.apagar_luz_sala = false
	camera_sala_jug.reparent(jugador)
	camera_sala_jug.position.x = 0
	camera_sala_jug.position.y = 0
	camera_sala_jug.zoom.x = 3
	camera_sala_jug.zoom.y = 3
	Globales.movimientoEnemigo = false
	Globales.movimiento_lateral_activado = true
	#Globales.animacion_sala = false
	return

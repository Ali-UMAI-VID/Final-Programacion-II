extends Node2D
@onready var animacion_sala_luz = $AnimacionSalaLuz
@onready var camera_sala_jug = $CameraSala_jug
@onready var jugador = $Jugador

func _ready():
	await animacion_sala_luz.animation_finished
	camera_sala_jug.reparent(jugador)
	camera_sala_jug.position.x = 0
	camera_sala_jug.position.y = 0
	camera_sala_jug.zoom.x = 3
	camera_sala_jug.zoom.y = 3
	#if animacion_sala_luz.animation_finished:
		#animacion_sala_luz.play("SalaIluminado")
		#camera_sala_jug.position.x = jugador.position.x
		#camera_sala_jug.position.y = jugador.position.y
		#jugador.add_child(camera_sala_jug)
		#camera_sala_jug.zoom.x = 3
		#camera_sala_jug.zoom.y = 3

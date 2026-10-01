extends Node2D
@onready var animacion_sala_luz = $AnimacionSalaLuz
@onready var camera_sala_jug = $CameraSala_jug
@onready var jugador = $Jugador

@onready var mimico = $Mimico
@export var velo_mimico = 200
var ene_principio = false
func _ready():
	ene_principio = true
	await animacion_sala_luz.animation_finished
	camera_sala_jug.reparent(jugador)
	camera_sala_jug.position.x = 0
	camera_sala_jug.position.y = 0
	camera_sala_jug.zoom.x = 3
	camera_sala_jug.zoom.y = 3
	ene_principio = false
	mimico.position= Vector2(973, 567)
	Globales.enemigo = 1
	#if animacion_sala_luz.animation_finished:
		#animacion_sala_luz.play("SalaIluminado")
		#camera_sala_jug.position.x = jugador.position.x
		#camera_sala_jug.position.y = jugador.position.y
		#jugador.add_child(camera_sala_jug)
		#camera_sala_jug.zoom.x = 3
		#camera_sala_jug.zoom.y = 3
func _physics_process(delta):
	var direction_enemigo: Vector2
	if ene_principio == true:
		direction_enemigo.y = 1
		mimico.velocity = direction_enemigo * velo_mimico
		mimico.move_and_slide()

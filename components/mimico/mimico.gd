extends CharacterBody2D
class_name Enemigo
@onready var animacion_mimico = $Animacion_mimico
@export var numero_de_mimico: int = 0
@export var velo_mimico: int = 150
func _ready():
	if numero_de_mimico == 1:
		position = Vector2(716, 90)
	if numero_de_mimico == 2:
		position = Vector2(412, -596)
	if numero_de_mimico == 3:
		position = Vector2(99, -1275.0)

var direccion : Vector2
func esconder_mimico():
	var posicion_final : Vector2 = Vector2(0,0)
	
	if numero_de_mimico == 1:
		posicion_final = Vector2(973, 567)
	var frame : int
	if numero_de_mimico == 1:
		frame = 4
	var escala : float
	if numero_de_mimico == 1:
		escala = 0.7
	
	if numero_de_mimico == 2:
		posicion_final = Vector2(459, -214)
	if numero_de_mimico == 2:
		frame = 4
	if numero_de_mimico == 2:
		escala = 0.7
	
	if numero_de_mimico == 3:
		posicion_final = Vector2(459, -1171.0)
	if numero_de_mimico == 3:
		frame = 4
	if numero_de_mimico == 3:
		escala = 1.2
	
	direccion.y = 1
	print("Moviendo nivel %s" % numero_de_mimico)
	await Globales.animacion_sala.animation_finished
	print("Movido nivel %s" % numero_de_mimico)
	direccion.y = 0
	animacion_mimico.stop()
	animacion_mimico.animation = "mimico_objetos"
	animacion_mimico.frame = frame
	position = posicion_final
	scale = Vector2(escala,escala)
	

func _physics_process(delta):
	#cambia la skin del enemigo en relacion al nivel
	#var direction_enemigo: Vector2
	#if numero_de_mimico == Globales.estado_nivel:
		#if Globales.movimientoEnemigo == true:
			#direction_enemigo.y = 1
			#velocity = direction_enemigo * velo_mimico
			#move_and_slide()
		#else:
			#position = Vector2(973, 567)
			#animacion_mimico.animation = "mimico_objetos"
			#animacion_mimico.frame = 4
			#set_scale(Vector2(0.7,0.7))
	velocity = direccion * velo_mimico
	move_and_slide()
	if Globales.estado_nivel == numero_de_mimico:
		if Globales.enemigo_matado == true:
			queue_free()


func _on_gameplay_niveles_nivel_cambiado():
	print(numero_de_mimico == Globales.estado_nivel)
	if numero_de_mimico == Globales.estado_nivel:
		esconder_mimico()

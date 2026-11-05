extends CharacterBody2D
class_name Enemigo
@onready var animacion_mimico = $Animacion_mimico
@export var numero_de_mimico: int = 0
@export var velo_mimico: int = 150
func _ready():
	if numero_de_mimico ==1:
		position = Vector2(856, 90)
		
func _physics_process(delta):
	#cambia la skin del enemigo en relacion al nivel
	var direction_enemigo: Vector2
	if numero_de_mimico == 1:
		if Globales.movimientoEnemigo == true:
			direction_enemigo.y = 1
			velocity = direction_enemigo * velo_mimico
			move_and_slide()
		else:
			position = Vector2(973, 567)
			animacion_mimico.animation = "mimico_objetos"
			animacion_mimico.frame = 4
			set_scale(Vector2(0.7,0.7))
	
	if Globales.enemigo_matado == true:
		queue_free()

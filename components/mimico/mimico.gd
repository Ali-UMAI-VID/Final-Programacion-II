extends CharacterBody2D
class_name Enemigo
@onready var animacion_mimico = $Animacion_mimico

func _physics_process(delta):
	#cambia la skin del enemigo en relacion al nivel
	if Globales.enemigo == 1:
		animacion_mimico.animation = "mimico_objetos"
		animacion_mimico.frame = 4
		set_scale(Vector2(0.2,0.2))
	
	if Globales.enemigo_matado == true:
		queue_free()
		Globales.enemigo_matado = false

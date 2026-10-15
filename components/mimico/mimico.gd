extends CharacterBody2D
class_name Enemigo
@onready var animated_sprite_2d:AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	#cambia la skin del enemigo en relacion al nivel
	if Globales.enemigo == 1:
		animated_sprite_2d.frame = 4
		set_scale(Vector2(0.7,0.7))
	
	if Globales.enemigo_matado == true:
		queue_free()
		Globales.enemigo_matado = false

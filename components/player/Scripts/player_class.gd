extends Actor
class_name Player

@export var sprite : AnimatedSprite2D
var movimiento_lateral_activado : bool = true
@export var velocidad : float = 200
@onready var maquina : MaquinaEstado = get_node("MaquinaEstado")

func _physics_process(delta):
	if movimiento_lateral_activado:
		direction = Input.get_vector(
			"move_left",
			"move_right",
			"move_up",
			"move_down"
		)

		velocity = direction * velocidad

		if direction.x < 0:
			#sprite.play("caminando")
			sprite.flip_h = true
		elif direction.x > 0:
			#sprite.play("caminando")
			sprite.flip_h = false
		#if direction.y < 0:
		#	sprite.play("caminando")
		#elif direction.y > 0:
		#	sprite.play("caminando")
		maquina.estado.proceso(delta)
	else:
		velocity = Vector2.ZERO
	#print(direction.y)
	move_and_slide()

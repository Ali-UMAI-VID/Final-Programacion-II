extends CharacterBody2D
class_name Actor

##La vida del actor, al llegar a 0, automaticamente se llamara la funcion de muerte
var health: int
@export var speed : float
var direction: Vector2


##funcion que  se ejecuta una vez por tick, y aplica
func process_move():
	velocity = direction * speed
	move_and_slide()

func die():
	pass

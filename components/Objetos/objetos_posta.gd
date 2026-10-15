extends Area2D
@export var tipo_objeto : int
@onready var frames_objetos = $Frames_objetos
#@export var numero_animacion: int = 1

func _physics_process(delta):
	frames_objetos.frame = tipo_objeto
	#frames_objetos.animation = "Tipos_objetos_" + str(numero_animacion)
	#cambia el tamaño por el frame
	if tipo_objeto == 3:
		scale = Vector2(0.5,0.5)
		position = Vector2(1188.0, 631)

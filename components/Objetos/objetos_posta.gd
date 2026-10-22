extends Node2D
class_name Objetos_reales
@export var tipo_objeto : int
#@export var numero_animacion: int = 1
@onready var frames_objetos = $StaticBody2D/Frames_objetos

func _physics_process(delta):
	frames_objetos.frame = tipo_objeto
	#frames_objetos.animation = "Tipos_objetos_" + str(numero_animacion)
	#cambia el tamaño por el frame
	if tipo_objeto == 3:
		scale = Vector2(0.5,0.5)
		position = Vector2(1188.0, 631)

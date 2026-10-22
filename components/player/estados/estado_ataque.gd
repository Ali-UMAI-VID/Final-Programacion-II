extends Estado
class_name EstadoAtaque
@onready var animacion_jugador : AnimatedSprite2D = $"../../AnimacionJugador"
@onready var area_espada : Area2D = $"../../Area_Espada"

func entrada():
	maquina.player.movimiento_lateral_activado = false
	animacion_jugador.play("ataque")
	await animacion_jugador.animation_finished
	maquina.transcicionar("EstadoNormal")

func _physics_process(delta):
	#el area esta activa mientras este llamado el estadoAtaque
	area_espada.monitoring = maquina.estado == self
func proceso(_delta):
		if Globales.durabilidad <= 0:
			Globales.durabilidad = 0
##Funcion donde el area de la espada detecta si el area entrante pertenece a los grupos globales de "Objetos" o "Mimico"
func _on_area_espada_area_entered(area):
	if area.is_in_group("Objetos"):
		Globales.durabilidad -= 1
		if Globales.durabilidad <= 0:
			Globales.durabilidad = 0
		area.get_parent().queue_free()
		print(Globales.durabilidad)

	if area.is_in_group("Mimico"):
		Globales.enemigo_matado = true

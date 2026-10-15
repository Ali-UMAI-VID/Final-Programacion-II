extends Estado
class_name EstadoNormal

@onready var animacion_jugador = $"../../AnimacionJugador"
@onready var jugador = $"../.."

func entrada():
	maquina.player.movimiento_lateral_activado = true

func proceso(_delta):
	if jugador.velocity.length() > 0:	#lenght es la distancia a diferencia de 0
		animacion_jugador.play("caminando")
	else:
		animacion_jugador.play("quieto")
	
	if Input.is_action_just_pressed("attack"):
		maquina.transcicionar("EstadoAtaque")
		return

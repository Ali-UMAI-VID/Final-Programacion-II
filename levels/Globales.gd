extends Node

enum SkinsEnemigo {SKIN_DEFAULT, SKIN_CASTILLO, SKIN_MADERA}
var enemigo: int = SkinsEnemigo.SKIN_DEFAULT
var movimientoEnemigo: bool = false

var enemigo_matado = false
var estado_nivel: int = 0
var nodo_nivel : Nivel
var animacion_sala : AnimationPlayer

var movimiento_lateral_activado : bool = true

var objeto_destruido = false
var durabilidad: int = 3

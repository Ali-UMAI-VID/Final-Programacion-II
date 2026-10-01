extends Node

var Oscurece : bool = false

enum SkinsEnemigo {SKIN_DEFAULT, SKIN_CASTILLO, SKIN_MADERA}
var enemigo: int = SkinsEnemigo.SKIN_DEFAULT
var enemigo_matado = false

var objeto_destruido = false
var durabilidad: int = 3

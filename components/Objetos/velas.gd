extends StaticBody2D
@onready var punto_de_luz_vela : PointLight2D = $"Punto de luz"
@export var fuerza_vela : float = 0
@export var fuerza_antorcha : float = 0
@onready var sprite_luz: AnimatedSprite2D = $SpriteLuz
@export var tipo_luz: int = 0
@onready var punto_de_luz_antorcha: PointLight2D = $"Punto de antorcha"

func _physics_process(delta):
	punto_de_luz_vela.energy = fuerza_vela
	punto_de_luz_antorcha.energy = fuerza_antorcha
	if fuerza_vela == 0:
		sprite_luz.frame = 0
	if fuerza_vela > 0:
		sprite_luz.frame = 1
	if fuerza_antorcha == 0 and tipo_luz >= 2:
		sprite_luz.frame = 2
	if fuerza_antorcha > 0 and tipo_luz >= 2:
		sprite_luz.frame = 3

	#if punto_de_luz.energy >= 1.8:
	#	punto_de_luz.energy = 1.8

func _on_area_luz_area_entered(area):
	if area.is_in_group("Jugador"):
		if tipo_luz == 0:
			var tween_luz = create_tween()
			tween_luz.set_trans(Tween.TRANS_CUBIC)
			tween_luz.tween_property(self,"fuerza_vela",1.8,0.5)
			if fuerza_vela >= 1.8:
				fuerza_vela = 1.8


func _on_area_luz_area_exited(area):
	if area.is_in_group("Jugador"):
		if sprite_luz.frame == 1:
			var tween_luz = create_tween()
			tween_luz.set_trans(Tween.TRANS_CUBIC)
			tween_luz.tween_property(self,"fuerza_vela",0.0,0.5) #a que valor va a ir y cuanto tiempo
			if fuerza_vela <= 0:
				fuerza_vela = 0
				



func _on_area_antorcha_area_entered(area):
	if area.is_in_group("Jugador"):
		if tipo_luz == 2:
			var tween_luz = create_tween()
			tween_luz.set_trans(Tween.TRANS_CUBIC)
			tween_luz.tween_property(self,"fuerza_antorcha",1.8,0.5)
			if fuerza_antorcha >= 1.8:
				fuerza_antorcha= 1.8


func _on_area_antorcha_area_exited(area):
	if area.is_in_group("Jugador"):
		if sprite_luz.frame == 3:
			var tween_luz = create_tween()
			tween_luz.set_trans(Tween.TRANS_CUBIC)
			tween_luz.tween_property(self,"fuerza_antorcha",0.0,0.5)
			if fuerza_antorcha >= 0:
				fuerza_antorcha= 0

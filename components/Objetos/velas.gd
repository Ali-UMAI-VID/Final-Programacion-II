extends StaticBody2D
@onready var punto_de_luz : PointLight2D = $"Punto de luz"

func _physics_process(delta):
	
	if Globales.apagar_luz_sala == true:
		punto_de_luz.energy = 0
	if Globales.apagar_luz_sala == false:
		punto_de_luz.energy += 1
	if punto_de_luz.energy >= 1.8:
		punto_de_luz.energy = 1.8

extends CharacterBody2D

# velocidad máxima a la que nos moveremos
@export var move_speed : float = 100
# tasa de aceleración del personaje
@export var acceleration : float = 70
# tasa a la que iremos frenando al dejar de presionar algún control
@export var braking : float = 25
# fuerza de la gravedad aplicada al jugador
@export var gravity : float = 500
# fuerza del impulso al saltar
@export var jump_force : float = 190
# variable donde almacenaremos las entradas para el movimiento
var move_input : float

func _physics_process(delta: float):
	if not is_on_floor():
		velocity.y += gravity * delta# obtener la entrada
	move_input = Input.get_axis("izquierda", "derecha")
	# movimiento
	if move_input != 0:
# entonces la velocidad en x es interpolada entre el reposo y la aceleración
		velocity.x = lerp(velocity.x, move_input * move_speed, acceleration * delta)
		# si no
	else:
		# velocidad en x es interpolada entre el movimiento y el "freno"
		velocity.x = lerp(velocity.x, 0.0, braking * delta)
	# Salto
# Si la tecla de salto ha sido presionada y estamos en el suelo...
	if Input.is_action_pressed("salto") and is_on_floor():
# entonces...
		velocity.y =-jump_force
	move_and_slide()

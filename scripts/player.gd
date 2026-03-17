extends CharacterBody2D

# velocidad máxima a la que nos moveremos
@export var move_speed : float = 100
# tasa de aceleración del personaje
@export var acceleration : float = 70
# tasa a la que iremos frenando al dejar de presionar algún control
@export var braking : float = 15
# fuerza de la gravedad aplicada al jugador
@export var gravity : float = 500
# fuerza del impulso al saltar
@export var jump_force : float = 220
# variable donde almacenaremos las entradas para el movimiento
var move_input : float

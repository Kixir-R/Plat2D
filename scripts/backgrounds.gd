extends Node2D

# tasa de movimiento relativo al jugador (70% de su velocidad)
var parallax : float = 0.7
# referencia al nodo Player
@onready var player = $"../Player"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
# Obtenemos la posición global del nodo tras multiplicar la del jugador
# por parallax
	global_position = player.global_position * parallax

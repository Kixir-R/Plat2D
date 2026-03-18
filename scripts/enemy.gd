extends Area2D

# dirección del movimiento
@export var move_direction : Vector2
# velocidad del movimiento
@export var move_speed : float = 20
# variable lista cuando el nodo esté listo, posición inicial
@onready var start_pos : Vector2 = global_position
# posición final
@onready var target_pos : Vector2 = global_position + move_direction

func _physics_process(delta):
# Se mueve hacia delante, a la posición objetivo a la velocidad indicada
	global_position = global_position.move_toward(target_pos, move_speed * delta)
	# si la posición global es igual a la objetivo:
	if global_position == target_pos:
	# si la posición objetivo y la inicial son la misma:
		if target_pos == start_pos:
	# el objetivo es la posición inicial mas la dirección del movimiento
			target_pos = start_pos + move_direction
	# si no:
		else:
	# la posición objetivo y la inicial son la misma
			target_pos = start_pos


func _on_body_entered(body: Node2D):
# Si el cuerpo que entró no está en "Players":
	if not body.is_in_group("Players"):
	# regresa y hace nada
		return
	# si no, imprime "Daño"
	print("Daño")

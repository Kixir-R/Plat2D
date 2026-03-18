extends Area2D

# velocidad de rotación
var rotate_speed : float = 3.0
# altura que flota
var bob_height : float = 5.0
# velocidad a la que flota
var bob_speed : float = 5.0
# posición inicial
@onready var start_pos : Vector2 = global_position
# sprite a cargar
@onready var sprite : Sprite2D = $CoinSprite
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
# obtener tiempo del SO
	var time = Time.get_unix_time_from_system()
	# rota
	sprite.scale.x = sin(time * rotate_speed)
	# flota arriba y abajo
	var y_pos = ((1 + sin(time * bob_speed)) / 2) * bob_height
	# nueva posición
	global_position.y = start_pos.y- y_pos


func _on_body_entered(body: Node2D) -> void:
	# Si el cuerpo que entra no está en "Players":
	if not body.is_in_group("Players"):
	# devuelve nada
		return
	# si sí está, llama a la función y mándale un 1
	body.increase_score(1)
	# borra la moneda
	queue_free()

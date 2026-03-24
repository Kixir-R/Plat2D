extends CanvasLayer

#contenedordecorazones
@onready var health_container =$HealthContainer
#loscorazonesensí
var hearts:Array=[]
#etiquetadelpuntaje
@onready var score_text:Label= $ScoreText
#referenciaaljugador
@onready var player =get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	hearts =health_container.get_children()
	player.OnUpdateHealth.connect(_update_hearts)
	player.OnUpdateScore.connect(_update_score)
	_update_hearts(player.health)
	_update_score(PlayerStats.score)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#actualizarelnúmerodecorazones
func _update_hearts(health : int):
	for i in range(len(hearts)):
		hearts[i].visible = i < health
#actualizarelpuntaje
func _update_score(score : int):
	score_text.text = "Score: " + str(score)

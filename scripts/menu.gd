extends Control

func _on_play_button_pressed():
# Mandamos a cero el puntaje
	PlayerStats.score = 0
	# cargamos el primer nivel
	get_tree().change_scene_to_file("res://scenes/level_01.tscn")
	
func _on_quit_button_pressed():
	# cerramos el juego
	get_tree().quit()

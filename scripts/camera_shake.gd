extends Camera2D

#intensidaddelasacudida
var intensity:float= 0
#Calledwhenthenodeentersthescenetreeforthefirsttime.
func _ready()-> void:
#nosconectamosconlaseñaldedaño
	get_parent().OnUpdateHealth.connect(_damage_shake)
func _damage_shake(health:int):
	intensity= 4
#Calledeveryframe.'delta'istheelapsedtimesincethepreviousframe.
func _process(delta:float):
#disminuiremoslaintensidaddeldañoconformepaseeltiempo
	if intensity > 0:
	#interpolamosdecrecientemente
		intensity= lerpf(intensity, 0,delta* 10)
		#eloffsetdelacámaratomaunvaloraleatorio
		offset = _get_random_offset()
#funciónquecreaydevuelveelvalordeoffsetparalacámara
func _get_random_offset()->Vector2:
	var x= randf_range(-intensity,intensity)
	var y= randf_range(-intensity,intensity)
	return Vector2(x,y)

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Verificar se algum Dialog está sendo executado no momento
	if Dialogic.current_timeline != null:
		return
	
	# Utilizando o Event glogal do Dialog para dar play de forma dinámica
	DialogEvent.play("test")

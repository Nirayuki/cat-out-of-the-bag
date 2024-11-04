extends Node

signal play_dialog(name: String, type: String)

func _ready() -> void:
	play_dialog.connect(play)

# Função de play onde está tratando o pause do tree e o unpause
func play(name: String) -> void:
	# Sinal após a timeline acabar, executar a função "unpauseTree"
	Dialogic.timeline_ended.connect(unpauseTree)
	# Pausar a tree
	pauseTree()
	# Iniciar o dialog de forma dinámica e configurando o Dialogic como HOT-RELOAD
	# para não ser afetado no get_tree paused
	Dialogic.start(name).process_mode = Node.PROCESS_MODE_ALWAYS
	# Aqui o mesmo
	Dialogic.process_mode = Node.PROCESS_MODE_ALWAYS

func unpauseTree() -> void:
	# Desconectando o sinal
	Dialogic.timeline_ended.disconnect(unpauseTree)
	# Despausando tree
	get_tree().paused = false
	
func pauseTree() -> void:
	get_tree().paused = true

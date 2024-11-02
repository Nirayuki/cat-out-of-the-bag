extends Area2D
@export var DialogPath: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Função para verificar se o play entrou na area
func _on_body_entered(body: Node2D) -> void:
	# Verificando se o corpo tem a função "in_interaction"
	if(body.has_method("in_interaction")):
		# Executando a função do play e passando o dialog de forma dinamica
		body.in_interaction(DialogPath)

# Função para verificar se o play saiu da area
func _on_body_exited(body: Node2D) -> void:
	# Verificando se o corpo tem a função "out_interaction"
	if(body.has_method("out_interaction")):
		# Executando a função
		body.out_interaction()

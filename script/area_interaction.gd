extends Area2D
class_name ActionArea

@export var ActionScript: Node2D
@export var is_body_inside: bool = false

@onready var player_node: Node2D = get_node("/root/World/Player")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action") and is_body_inside == true:
		handle_action()

# Função para verificar se o play entrou na area
func _on_body_entered(body: Node2D) -> void:
	# Verificando se o corpo tem a função "in_interaction"
	if(body.has_method("in_interaction")):
		is_body_inside = true
		# Executando a função do play e passando o dialog de forma dinamica
		body.in_interaction()
		

# Função para verificar se o play saiu da area
func _on_body_exited(body: Node2D) -> void:
	# Verificando se o corpo tem a função "out_interaction"
	if(body.has_method("out_interaction")):
		is_body_inside = false
		# Executando a função
		body.out_interaction()
		

func handle_action() -> void:
	ActionScript.handle_action()

extends CharacterBody2D

# NORMAL VARS
const SPEED: float = 50.0
const JUMP_VELOCITY: float = -400.0
var dialogPath: String

# ONREADY VARS
@onready var sprite: AnimatedSprite2D = %Sprite
@onready var label_action: Label = %Label_action

# EXPORT VARS
@export var is_action: bool = false


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		sprite.play("walk")
		if velocity.x < 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
	else:
		sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	is_action_waiting()
	move_and_slide()

# Função de interação IN, quando o player passa pela area será ativado essa função
func in_interaction(dialog: String) -> void:
	# Torna o label action visivel
	label_action.visible = true
	# Adiciona o dialog para o dialogPath, será utilizado na função is_action_waiting
	dialogPath = dialog
	# Adicionando o is_action verdadeiro
	is_action = true

# Função de interação OUT, quando o player sai da area será ativado essa função
func out_interaction() -> void:
	# Torna o label action invisisvel
	label_action.visible = false
	# Adicionando o is_action falso
	is_action = false
	
# Função para verificar se o play vai apertar o botão de ação.
func is_action_waiting() -> void:
	if is_action:
		if Input.is_action_pressed("action"):
			if dialogPath:
				DialogEvent.play(dialogPath)

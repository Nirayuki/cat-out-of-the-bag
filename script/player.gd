extends CharacterBody2D

# NORMAL VARS
const SPEED: float = 50.0
const JUMP_VELOCITY: float = -400.0
var dialogPath: String

# ONREADY VARS
@onready var sprite: AnimationPlayer = %Animation
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
			%Sprite2D.flip_h = false
		else:
			%Sprite2D.flip_h = true
	else:
		sprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

# Função de interação IN, quando o player passa pela area será ativado essa função
func in_interaction() -> void:
	# Torna o label action visivel
	label_action.visible = true

# Função de interação OUT, quando o player sai da area será ativado essa função
func out_interaction() -> void:
	# Torna o label action invisisvel
	label_action.visible = false
	

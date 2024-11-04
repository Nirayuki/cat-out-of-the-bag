extends Node2D
class_name Item

@export var Sprite_Image: CompressedTexture2D
@onready var Sprite: Sprite2D = %Sprite
@export var TexturePath: String
@export var Name: String
@export var Description: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Sprite_Image:
		Sprite.texture = Sprite_Image

# Setar textura no Item
func setTexture(texture: CompressedTexture2D) -> void:
	Sprite.texture = texture

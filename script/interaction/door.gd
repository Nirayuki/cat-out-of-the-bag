extends Node2D

@export var DialogPath: String
@export var ItemName: String
@export var Action: String

@export var NextScene: PackedScene

var is_opened: bool = false

func handle_action():
	if Action == "default" and !PlayerEvent.is_using_item:
		default()
	elif Action == "custom":
		custom()
	elif PlayerEvent.is_using_item:
		use_item()

func default():
	DialogEvent.play(DialogPath)
	
func use_item():
	if !is_opened:
		if PlayerEvent.selectedItem.Name == ItemName:
			Dialogic.VAR.is_using_item = true
			Dialogic.VAR.is_right_item = true
			Dialogic.VAR.item_name = ItemName 
			DialogEvent.play(DialogPath)
			Action = "custom"
			is_opened = true
		else:
			Dialogic.VAR.is_right_item = false
			DialogEvent.play(DialogPath)
		
func custom():
	get_tree().change_scene_to_packed(NextScene)

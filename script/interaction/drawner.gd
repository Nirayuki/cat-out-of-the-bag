extends Node2D

@export var DialogPath: String
@export var ItemPackedScene: PackedScene
@export var ItemPath: String
@export var ItemName: String
@export var Action: String

var is_item_taken: bool = false

func _ready() -> void:
	Dialogic.signal_event.connect(Is_item_taken)

func handle_action() -> void:
	if Action == "default" and !PlayerEvent.is_using_item:
		default()
	elif Action == "take_item" and !PlayerEvent.is_using_item:
		take_item()
	elif PlayerEvent.is_using_item:
		use_item()
			
func take_item() -> void:
	if !is_item_taken:
		Dialogic.VAR.is_take_item = false
	else:
		Dialogic.VAR.is_take_item = true
		Action = "default"
		
	DialogEvent.play(DialogPath)
	
func use_item() -> void:
	Dialogic.VAR.is_using_item = true
	DialogEvent.play(DialogPath)
	
func default():
	DialogEvent.play(DialogPath)
	
		
func Is_item_taken(argument: String) -> void:
	Dialogic.signal_event.disconnect(Is_item_taken)
	if argument == "item_taken":
		is_item_taken = true
		var item = ItemPackedScene.instantiate()
		
		PlayerEvent.emit_signal("set_inventory_item", item)
		PlayerEvent.add_item(item)
		PlayerEvent.gold_key = true

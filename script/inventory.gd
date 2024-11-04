extends Control
class_name Inventory

@onready var ItemsContainer: GridContainer = %ItemsContainer
@onready var PanelBackground: Panel = %PanelBackground

var is_open: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerEvent.set_inventory_item.connect(set_inventory_item)
	
	for i in PlayerEvent.array_items:
		set_inventory_item(i)

func _process(delta: float) -> void:
	if Dialogic.current_timeline != null:
		return
		
	open_inventory()
	
func set_inventory_item(item: Item):
	var inventory_slot_scene = preload("res://scene/inventory_slot.tscn")
	var inventory_slot = inventory_slot_scene.instantiate()
	inventory_slot.label_description = %Label
	inventory_slot.setItemInSlot(item)
	ItemsContainer.add_child(inventory_slot)


func open_inventory():
	if Input.is_action_just_pressed("inventory"):
		if not is_open and !get_tree().paused:
			get_tree().paused = true
			PanelBackground.visible = true
			is_open = true
		elif is_open and get_tree().paused:
			get_tree().paused = false
			PanelBackground.visible = false
			is_open = false

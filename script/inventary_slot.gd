extends Control
class_name InventorySlot

@export var item: Item
@export var is_selected: bool = false
@onready var label_description: Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_index() == PlayerEvent.selectedItemIndex:
		%Button.button_pressed = true	
		label_description.text = PlayerEvent.selectedItem.Description
		item =  PlayerEvent.selectedItem
		is_selected = true

func setItemInSlot(itemProps: Item):
	%Button.texture_normal = load("res://assets/Items/" + itemProps.TexturePath + "-normal.png")
	%Button.texture_hover = load("res://assets/Items/" + itemProps.TexturePath + "-hover.png")
	%Button.texture_pressed = load("res://assets/Items/" + itemProps.TexturePath+ "-pressed.png")
	
	item = itemProps
	
func selectItem() -> void:
	PlayerEvent.select_item.emit(item, get_index())
	label_description.text = item.Description
	%Button.button_pressed = true
	is_selected = true
	
func deselectItem() -> void:
	PlayerEvent.deselect_item.emit()
	label_description.text = ""
	%Button.button_pressed = false
	is_selected = false
	
func _on_button_pressed() -> void:
	if !is_selected:
		selectItem()
	else:
		deselectItem()
	

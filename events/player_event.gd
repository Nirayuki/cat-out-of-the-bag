extends Node

var array_items: Array[Item]
var selectedItem: Item
var selectedItemIndex: int = 999
var is_using_item: bool = false

# Objetivos
var gold_key: bool = false

signal set_inventory_item(path: String, item: Item)
signal select_item(item: Item, index: int)
signal deselect_item()

func _ready() -> void:
	select_item.connect(selectItem)
	deselect_item.connect(descelectItem)

func add_item(new_item: Item) -> void:
	if array_items.size() < 2:
		array_items.push_back(new_item)

func selectItem(item: Item, index: int):
	selectedItem = item
	selectedItemIndex = index
	Dialogic.VAR.is_using_item = true
	is_using_item = true

func descelectItem():
	selectedItem = null
	Dialogic.VAR.is_using_item = false
	is_using_item = false
	selectedItemIndex = 999
	

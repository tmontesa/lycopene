extends Node

# ======================================
# Overrides
# ======================================

func _ready() -> void:
	var inventory = ItemStorage.new()
	inventory.add_item(load("res://Item/items/_Test1.tres"), 64)
	inventory.add_item(load("res://Item/items/_Test2.tres"), 128)
	inventory.add_item(load("res://Item/items/_Test3.tres"), 32)

	inventory.print_items()

	inventory.add_item(load("res://Item/items/_Test1.tres"), 2)
	inventory.add_item(load("res://Item/items/_Test2.tres"), 2)
	inventory.add_item(load("res://Item/items/_Test3.tres"), 2)
	
	inventory.print_items()
	
	inventory.remove_item(load("res://Item/items/_Test1.tres"), 66)
	inventory.remove_item(load("res://Item/items/_Test2.tres"), 130)
	inventory.remove_item(load("res://Item/items/_Test3.tres"), 999)

	inventory.print_items()

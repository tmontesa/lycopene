extends Node

# ======================================
# Overrides
# ======================================

func _ready() -> void:
	var Items = DatabaseFactory.generate("Item/items")
	
	var inventory = ItemStorage.new()
	inventory.add_item(Items._TEST1, 64)
	inventory.add_item(Items._TEST2, 128)
	inventory.add_item(Items._TEST3, 32)

	inventory.print_items()


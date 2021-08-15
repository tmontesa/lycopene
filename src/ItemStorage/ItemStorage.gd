extends Node
class_name ItemStorage

# ======================================
# Properties
# ======================================

var slots : Array = []

# ======================================
# Public
# ======================================

func get_item(i : int) -> Item:
	return slots[i].item

func find_item_index(item: Item) -> int:
	for i in range(slots.size()):
		if (slots[i].item == item):
			return i
	return -1

func add_item(item : Item, n : int) -> void:
	var i = find_item_index(item)
	if (i >= 0):
		slots[i].add_amount(n)
	else:
		var new_item_slot : ItemStorageSlot = ItemStorageSlot.new(item, n)
		slots.append(new_item_slot)

func remove_item(item : Item, n : int) -> void:
	var i = find_item_index(item)
	if (i >= 0):
		slots[i].remove_amount(n)
	else:
		pass # TODO: Add negative check
		
# ======================================
# Debug
# ======================================

func print_items() -> void:
	for i in range(slots.size()):
		print("%3s: [%6s] %s" % [i, slots[i].get_amount(), slots[i].item.title])
	print("")

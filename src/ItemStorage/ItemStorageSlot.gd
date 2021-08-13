extends Node
class_name ItemStorageSlot

# ======================================
# Properties
# ======================================

var item : Item = null
var _amount : int = 0

# ======================================
# Overrides
# ======================================

func _init(item_ : Item, amount_ : int = 0) -> void:
	item = item_
	_amount = amount_

# ======================================
# Public
# ======================================

func get_amount() -> int:
	return _amount

func zero_amount() -> void:
	_amount = 0

func add_amount(n : int) -> void:
	_amount += n
	
func remove_amount(n : int) -> void:
	_amount -= n

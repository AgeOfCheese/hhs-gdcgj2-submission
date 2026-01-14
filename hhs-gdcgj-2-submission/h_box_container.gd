extends HBoxContainer

@export var player: Node

var slots: Array[InventorySlot]

func _ready():
	slots = []
	for child in get_children():
		if child is InventorySlot:
			slots.append(child)
func get_inventory_slots() -> Array[InventorySlot]:
	return slots.filter(func(s): return s.slot_speed != InventorySlot.SlotSpeed.HAND)

func get_hand_slot() -> InventorySlot:
	for s in slots:
		if s.slot_speed == InventorySlot.SlotSpeed.HAND:
			return s
	return null

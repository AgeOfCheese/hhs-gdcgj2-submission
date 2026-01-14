extends Control
class_name InventorySlot

enum SlotSpeed { FAST, SLOW, HAND }

@export var slot_speed: SlotSpeed = SlotSpeed.SLOW
@export var fast_color = Color(0.0,1.0,0.0,0.2)
@export var slow_color = Color(1.0,0.0,0.0,0.2)
@export var hand_color = Color(0.0,0.39,0.78,0.2)

var item: Node = null

@onready var background: ColorRect = $Background
@onready var icon: TextureRect = $Icon

func _ready():
	update_visuals()

func update_visuals():
	match slot_speed:
		SlotSpeed.FAST:
			background.color = fast_color
		SlotSpeed.SLOW:
			background.color = slow_color
		SlotSpeed.HAND:
			background.color = hand_color

	if item:
		icon.texture = item.sprite_2d
	else:
		icon.texture = null

func set_item(new_item: Node):
	item = new_item
	update_visuals()

func clear():
	item = null
	update_visuals()

func get_swap_time() -> float:
	match slot_speed:
		SlotSpeed.FAST:
			return 0.5
		SlotSpeed.SLOW:
			return 2.0
		SlotSpeed.HAND:
			return 0.0
	return 0.0

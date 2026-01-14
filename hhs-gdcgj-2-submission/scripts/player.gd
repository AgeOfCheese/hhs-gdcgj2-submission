extends CharacterBody2D

const SPEED = 500
var held_item: Item = null
var is_swapping := false
@onready var hand_slot = $"../CanvasLayer/HBoxContainer/Hand"
@onready var hotbar = $"../CanvasLayer/HBoxContainer"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta: float) -> void:
	print(held_item)
	hand_slot.set_item(held_item)
func _physics_process(delta):
	velocity = Input.get_vector("left","right","up", "down") * SPEED
	if abs(velocity) > Vector2.ZERO:
		$AnimatedSprite2D.play("walk")
		if velocity.x > 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")
	move_and_slide()
func request_swap(slot: InventorySlot):
	if is_swapping:
		return

	is_swapping = true
	var swap_time := slot.get_swap_time()

	await get_tree().create_timer(swap_time).timeout

	var previous_item := held_item
	held_item = slot.item
	slot.set_item(previous_item)

	is_swapping = false
	
func _input(event):
	if event.is_action_pressed("slot_1"):
		request_swap(hotbar.slots[0])
	if event.is_action_pressed("slot_2"):
		request_swap(hotbar.slots[1])
	if event.is_action_pressed("slot_3"):
		request_swap(hotbar.slots[2])
	if event.is_action_pressed("slot_4"):
		request_swap(hotbar.slots[3])

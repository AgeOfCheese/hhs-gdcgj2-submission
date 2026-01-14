extends Node2D
const ITEM = preload("uid://cjkgqf3pgpdrn")
var items = []#temp solutions
@onready var label = $Label
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	var gas_can = ITEM.instantiate()
	var hitbox = CircleShape2D.new()
	hitbox.radius = 10
	gas_can.set_sprite("res://sprites/gas.png")
	
	gas_can.set_collision_shape_2d(hitbox)
	
	gas_can.position = Vector2(200, 200)
	
	add_child(gas_can)
	items.append(gas_can)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(items.size()):
		if Input.is_action_pressed("drop") && items[i].is_being_held:
			items[i].is_being_held = false
			items[i].reparent(self)
			continue
		if items[i].near_item:
			label.position = items[i].position + Vector2(20,0)
			label.show()
			if Input.is_action_just_pressed("interact"):
				label.hide()
				items[i].reparent(player)
				items[i].is_being_held = true
				
		else:
			label.hide()

		

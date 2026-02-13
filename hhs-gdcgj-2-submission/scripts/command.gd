extends Area2D

signal action
var dragged = false
# Called when the node enters the scene tree for the first time.
func _ready():
	input_pickable = true
	input_event.connect(_on_input_event)
	print("Area2D ready, pickable: ", input_pickable)
	print("Children: ", get_children())
	
	if get_parent() is Node2D:
		for child in (get_parent().get_children()):
			if child is CharacterBody2D:
				action.connect(child.move)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragged:
		position = get_global_mouse_position()
		



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		if dragged:
			dragged = false
		else:
			dragged = true


func _on_area_entered(area: Area2D) -> void:
	if area.get_parent() is Control:
		reparent(area.get_parent())
		area.queue_free()
		dragged = false

extends Node2D

var commands: Array
var index: int
@onready var h_box_container = $HBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	commands = h_box_container.get_children()
	commands[index].get_child(0).action.emit()

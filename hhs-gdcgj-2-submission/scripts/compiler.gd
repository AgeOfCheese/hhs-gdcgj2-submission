extends Control

var commands: Array
var index: int
@onready var v_box_container = $VBoxContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	index = 0 # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout() -> void:
	commands = v_box_container.get_children()
	if commands[index].get_child(0).has_signal("action"):
		commands[index].get_child(0).action.emit()
	index+=1
	index%=commands.size()
	$Iterator.position.y = 43*index # Replace with function body.

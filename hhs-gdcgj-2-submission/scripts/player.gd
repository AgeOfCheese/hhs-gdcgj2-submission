extends CharacterBody2D

var DELTA = 2
const TILE_DIST = 100
# Called when the node enters the scene tree for the first time.
@onready var timer = $Timer
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	velocity = velocity.move_toward(Vector2.ZERO, DELTA*delta)
	print(position)
	move_and_slide()

func move():
	if velocity == Vector2.ZERO:
		velocity.x = 100
		velocity.y = 100
		DELTA = 10000/(2*TILE_DIST)
		print(DELTA)
func harvest():
	pass
func till():
	pass
func turn():
	pass
func pail():
	pass
func dump(): #dump water
	pass




func _on_timer_timeout():
	move()
	$Timer.start()

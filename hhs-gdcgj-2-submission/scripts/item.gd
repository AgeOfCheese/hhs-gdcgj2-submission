extends RigidBody2D

@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D

var near_item: bool = false
var is_being_held = false
var item_name: String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_sprite(texture: String):
	#sprite_2d = texture
	$Sprite2D.texture = load(texture)
	$Sprite2D.scale = Vector2(0.15,0.15)

func set_collision_shape_2d(shape):
	#collision_shape_2d.shape = shape
	$CollisionShape2D.shape = shape




func _on_pickup_area_body_entered(body):
	if body is CharacterBody2D && !is_being_held:
			near_item = true # Replace with function body.



func _on_pickup_area_body_exited(body):
	if body is CharacterBody2D && !is_being_held:
			near_item = false # Replace with function body.

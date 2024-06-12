extends StaticBody2D

var isroof = true

func _ready():
	#var i = str(randi_range(1,5))
	#var texture_name = "Roof" + i
	#var sprite = get_node(texture_name)
	#sprite.visible = true
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 666 * delta
	if position.x < -2000:
		queue_free()

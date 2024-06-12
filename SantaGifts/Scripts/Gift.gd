extends RigidBody2D

var moving

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#var i = str(randi_range(1,4))
	#var texture_name = "Gift" + i
	#var sprite = get_node(texture_name)
	#sprite.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2(-333, 800) * delta
	#position += moving * delta
	if self.position.y > 700:
		queue_free()
		get_parent().remove_hp()


func _on_area_2d_body_entered(body):
	if body.isroof:
		queue_free()
		get_parent().update_score()


func set_gift(gift_name):
	if gift_name == "Gift1":
		$Gift1.visible = true
		moving = Vector2(-333, 800)
	elif gift_name == "Gift2":
		$Gift2.visible = true
		moving = Vector2(-600, 800)
	elif gift_name == "Gift3":
		$Gift3.visible = true
		moving = Vector2(-800, 800)
	elif gift_name == "Gift4":
		$Gift4.visible = true
		moving = Vector2(-100, 800)

extends Node2D

@export var roof = preload("res://Objects/roof.tscn")
var pos = Vector2(1900, 700)
# Called when the node enters the scene tree for the first time.
func _ready():
	var score = 0
	$RoofTimer.start(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_roof_timer_timeout():
	var new_roof = roof.instantiate()
	new_roof.position = pos
	add_child(new_roof)
	var new_time = randf_range(1.5, 2.5)
	$RoofTimer.start(new_time)

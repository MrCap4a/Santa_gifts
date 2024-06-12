extends CharacterBody2D

@export var gift = preload("res://Objects/gift.tscn")
var next_gift = ""
var score = 0
var hp = 3
var file

func _ready():
	EventBus.update_ui.connect(func(_score):update_best(_score))
	if FileAccess.file_exists("data.txt"):
		file = FileAccess.open("data.txt", FileAccess.READ)
		update_best(int(file.get_as_text()))
		file.close()
	get_random_gift()

func _process(delta):
	if Input.is_action_just_pressed("space"):
		var spawn_position = $Spawnpoint.global_position
		var new_gift = gift.instantiate()
		new_gift.global_position = spawn_position
		new_gift.set_gift(next_gift)
		add_child(new_gift)
		get_random_gift()


func update_score():
	score += 1
	get_node("UI").get_node("Score_int_label").text = str(score)
	$"/root/Data".new_score(score)


func remove_hp():
	hp -= 1
	var s_hp = "Heart" + str(hp+1)
	get_node("UI/"+s_hp).visible = false
	if hp == 0:
		die()


func die():
	get_tree().reload_current_scene()


func update_best(_score):
	get_node("UI/Best_int_label").text = str(_score)


func set_visible_gift(name):
	var ar = ["Gift1", "Gift2", "Gift3", "Gift4"]
	for gift in ar:
		if gift == name:
			get_node(gift).visible = true
		else:
			get_node(gift).visible = false


func get_random_gift():
	var i = randi_range(1, 4)
	set_visible_gift("Gift"+str(i))
	next_gift = "Gift"+str(i)
	print(next_gift)

extends Node

var best_score = 0
var file

# Called when the node enters the scene tree for the first time.
func _ready():
	if FileAccess.file_exists("data.txt"):
		file = FileAccess.open("data.txt", FileAccess.READ)
		best_score = int(file.get_as_text())
		file.close()
		new_best(best_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func new_score(score):
	if score > best_score:
		new_best(score)


func new_best(score):
	best_score = score
	file = FileAccess.open("data.txt", FileAccess.WRITE)
	file.store_line(str(best_score))
	file.close()
	EventBus.update_ui.emit(score)


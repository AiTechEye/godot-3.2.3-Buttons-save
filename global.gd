extends Node
# This scene is added to the autoload project properties, so this will be reachable from the whole project

var current_scene_name = "world1"
var save = {
	"points":0,
}


func add_points(a = 1):
	save.points += a
	get_node("Label").text = str(save.points)


func _enter_tree():
	load_data()
	get_node("Label").text = str(save.points)

# saves everyhing in the "save" variable
func save_data():
	var file = File.new()
	file.open("user://save",file.WRITE_READ)
	file.store_var(save)
	file.close()
	
# and load
func load_data():
	var file = File.new()
	if not file.file_exists("user://save"):
		return false
	file.open("user://save",file.READ)
	save = file.get_var()
	file.close()
	return true

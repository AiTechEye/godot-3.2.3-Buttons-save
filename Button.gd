extends Control

# Collect buttons

func _ready():
	print(Global.save)
	if not Global.save.get(Global.current_scene_name):
		Global.save[Global.current_scene_name] = {}

	if Global.save[Global.current_scene_name].get(name):
		queue_free()

func _on_button_down():
	if not Global.save.get(Global.current_scene_name):
		Global.save[Global.current_scene_name] = {}
		
	#Add button name to save
	#Save		world name				  node name		just a value
	#save[level_name][node_name] = true
	Global.save[Global.current_scene_name][name] = true
	Global.save_data()
	Global.add_points()
	queue_free()
	print(Global.save)

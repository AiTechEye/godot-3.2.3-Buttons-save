extends Control

func _on_stuck_button_down():
	Global.save.stuck = true
	get_node("stuck").disabled = true
	Global.save_data()

func _on_stuck_tree_entered():
	if Global.save.get("stuck"):
		get_node("stuck").disabled = true


func _on_toggle_button_down():
	if Global.save.get("toggled") == false:
		Global.save.toggled = true
		get_node("toggled").text = "Toggle (ON)"
	else:
		Global.save.toggled = false
		get_node("toggled").text = "Toggle (OFF)"
	Global.save_data()


func _on_toggled_ready():
	if Global.save.get("toggled") == true:
		get_node("toggled").text = "Toggle (ON) (loaded)"
	elif Global.save.get("toggled") == false:
		get_node("toggled").text = "Toggle (OFF) (loaded)"
	else:
		get_node("toggled").text = "Toggle (ON) (not loaded)"


func _on_reset_button_down():
	if Global.save[Global.current_scene_name]:
		Global.save[Global.current_scene_name] = null
	get_tree().reload_current_scene()

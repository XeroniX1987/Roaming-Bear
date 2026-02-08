extends Control

func _input(event):
	
	if event is InputEventScreenTouch and event.pressed:
		go_to_step_counter()
	
	elif event is InputEventMouseButton and event.pressed:
		go_to_step_counter()

func go_to_step_counter():
	
	get_tree().change_scene_to_file("res://Scenes/step_counter.tscn")

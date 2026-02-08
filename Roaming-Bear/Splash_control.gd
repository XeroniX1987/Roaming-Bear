extends Control

@onready var anim_player: AnimationPlayer = $CanvasLayer/AnimationPlayer

# Prevent double taps
var tapped := false

func _unhandled_input(event):
	# If we already tapped once, ignore further input
	if tapped:
		return

	# If the player taps or clicks
	if (event is InputEventScreenTouch and event.pressed) \
	or (event is InputEventMouseButton and event.pressed):

		tapped = true

		
		anim_player.play("Black Fade")

	
		await get_tree().create_timer(0.25).timeout

		
		go_to_step_counter()


# This function changes the scene
func go_to_step_counter():
	get_tree().change_scene_to_file("res://Scenes/Step_counter.tscn")

extends CanvasLayer

@onready var anim = $AnimationPlayer

func _ready():
	play_sequence()

#This is to make the logo fade in and for the background to do the zoom in thingy
func play_sequence():
	anim.play("Zoom Out")
	await anim.animation_finished
	anim.play("Fade In")
	await anim.animation_finished
	
	#This is for the black fade transitions between scenes but ts doesn't work yet
func _unhandled_input(event):
	if event is InputEventScreenTouch and event.pressed:
		anim.play("Black Scene Transition")
		await anim.animation_finished
	elif event is InputEventMouseButton and event.pressed:
		anim.play("Black Scene Transition (Out)")

func go_to_step_counter():
	get_tree().change_scene_to_file("res://Scenes/Step_counter.tscn")
	
	

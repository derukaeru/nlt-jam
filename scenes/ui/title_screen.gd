extends Control

func _ready():
	pass # Replace with function body.

func _process(_delta):
	pass

func _on_start_mouse_entered(): 
	$start_bg/AnimationPlayer.play("show")
func _on_start_mouse_exited():
	$start_bg/AnimationPlayer.play("hide")

func _on_credits_mouse_entered(): $credits_bg/AnimationPlayer.play("show")
func _on_credits_mouse_exited(): $credits_bg/AnimationPlayer.play("hide")

func _on_exit_mouse_entered(): $exit_bg/AnimationPlayer.play("show")
func _on_exit_mouse_exited(): $exit_bg/AnimationPlayer.play("hide")

func _on_credits_exit_pressed():
	$credits_ui.hide()

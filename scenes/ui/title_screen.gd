extends Control

func _ready():
	$AnimationPlayer.play("show")
	await $AnimationPlayer.animation_finished
	$cover.hide()

func _on_start_mouse_entered(): 
	$start_bg/AnimationPlayer.play("show")
func _on_start_mouse_exited():
	$start_bg/AnimationPlayer.play("hide")

func _on_credits_mouse_entered(): $credits_bg/AnimationPlayer.play("show")
func _on_credits_mouse_exited(): $credits_bg/AnimationPlayer.play("hide")

func _on_exit_mouse_entered(): $exit_bg/AnimationPlayer.play("show")
func _on_exit_mouse_exited(): $exit_bg/AnimationPlayer.play("hide")

func _on_credits_pressed():
	$credits_ui.show()

func _on_credits_exit_pressed():
	$credits_ui.hide()

func _on_exit_pressed():
	pass # Replace with function body.

func _on_start_pressed():
	$cover.show()
	$AnimationPlayer.play("hide")
	await $AnimationPlayer.animation_finished
	Global.change_scene("res://scenes/main/main.tscn")

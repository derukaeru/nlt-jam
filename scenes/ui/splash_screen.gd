extends Control

func _ready():
	$AnimationPlayer.play("intro")
	await $AnimationPlayer.animation_finished
	Global.change_scene("res://scenes/ui/title_screen.tscn")

@tool
extends Node3D

@export var color : Color = Color("ee7a77")

func _ready():
	var material = StandardMaterial3D.new()
	material.albedo_color = color
	$MeshInstance3D.set_material_override(material)
	$MeshInstance3D2.set_material_override(material)

func open():
	$AnimationPlayer.play("open")
	
func close():
	$AnimationPlayer.play("close")

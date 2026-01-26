extends Node3D

func _on_plate_pressed(entity):
	$sliding_door2.open()
	
func _on_plate_2_pressed(entity):
	$sliding_door.open()

extends Node3D


func _on_plate_pressed(_entity):
	$sliding_door.open()

func _on_plate_depressed(_entity):
	$sliding_door.close()

class_name Collider
extends StaticBody3D

@export var mesh : Node3D

func on(): 
	self.set_collision_layer_value(1, true)
	
	if mesh:
		pass

func off(): 
	self.set_collision_layer_value(1, false)
	
	if mesh:
		pass

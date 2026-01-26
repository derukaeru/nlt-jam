extends StaticBody3D

enum LAYERS { DARK, LIGHT, BOTH }
@export var layer : LAYERS = LAYERS.LIGHT

func _ready():
	if layer == LAYERS.LIGHT:
		set_collision_layer_value(2, false)
		$MeshInstance3D.add_to_group("light_collider")
	elif layer == LAYERS.DARK:
		set_collision_layer_value(1, false)
		$MeshInstance3D.add_to_group("dark_collider")
	elif layer == LAYERS.BOTH:
		$MeshInstance3D.add_to_group("dual_collider")

extends Node3D

enum WORLDS { LIGHT, DARK }
var curr_world = WORLDS.LIGHT

func change_world(): 
	var light_colliders = get_tree().get_nodes_in_group("light_collider")
	for c in light_colliders:
		pass
	
	var dark_colliders = get_tree().get_nodes_in_group("dark_collider")
	for c in dark_colliders:
		pass
		
	if curr_world == WORLDS.LIGHT:
		$WorldEnvironment.environment.set_bg_color("151515")
	else:
		$WorldEnvironment.environment.set_bg_color("d6d6d6")
	
func _physics_process(_delta):
	if Global.input_once("interact"):
		pass

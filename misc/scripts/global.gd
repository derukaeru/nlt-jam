extends Node

func get_main(): 
	return get_tree().current_scene
	
func get_group_node(group): 
	return get_tree().get_first_node_in_group(group)

func get_nodes_in_group(group):
	return get_tree().get_nodes_in_group(group)

func change_scene(path:String):
	get_tree().change_scene_to_file(path)

func input(id):
	return Input.is_action_pressed(id)

func input_once(id):
	return Input.is_action_just_pressed(id)

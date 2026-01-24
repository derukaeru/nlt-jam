extends Node3D

enum WORLDS { LIGHT, DARK }
var curr_world = WORLDS.LIGHT

func _ready():
	change_dual_collider_color(Color(1.0, 1.0, 1.0, 1.0))
	change_group_nodes_alpha("light_collider", 1)
	change_group_nodes_alpha("dark_collider", .5)

func player_change_collision(layer, value):
	var player = Global.get_group_node("player")
	player.set_collision_mask_value(layer, value)
	player.set_collision_layer_value(layer, value)

func change_dual_collider_color(color:Color):
	for node in get_tree().get_nodes_in_group("dual_collider"):
		var material = StandardMaterial3D.new()
		material.albedo_color = color
		node.set_material_override(material)

func change_group_nodes_alpha(group, alpha:float):
	for node in get_tree().get_nodes_in_group(group):
		var material = StandardMaterial3D.new()
		material.albedo_color.a = alpha
		node.set_material_override(material)

func change_world(): 
	if curr_world == WORLDS.LIGHT:
		$WorldEnvironment.environment.set_bg_color(Color(0, 0, 0))
		change_group_nodes_alpha("light_collider", 0.5)
		change_group_nodes_alpha("dark_collider", 1)
		
		change_dual_collider_color(Color(255,255,255))
		curr_world = WORLDS.DARK
	else:
		$WorldEnvironment.environment.set_bg_color(Color(255, 255, 255))
		change_group_nodes_alpha("dark_collider", 0.5)
		change_group_nodes_alpha("light_collider", 1)
		
		change_dual_collider_color(Color(0,0,0))
		curr_world = WORLDS.LIGHT
	
	print(curr_world)
	
func _physics_process(_delta):
	if Global.input_once("interact"):
		change_world()

extends Node3D

enum WORLDS { LIGHT, DARK }
var curr_world = WORLDS.LIGHT

var curr_level = 1
var level_spawn = [Vector3(8.0, 6.58, 0.0)]

func _ready():
	$WorldEnvironment.environment.set_bg_color(Color("3b3b3bff"))
	change_dual_collider_color(Color(0.447, 0.447, 0.447, 1.0))
	change_group_nodes_alpha("light_collider", 1, Color(255, 255, 255))
	change_group_nodes_alpha("dark_collider", .5, Color(0.0, 0.0, 0.0, 1.0))

func player_change_collision(layer, value):
	var player = Global.get_group_node("player")
	player.set_collision_mask_value(layer, value)
	player.set_collision_layer_value(layer, value)

func change_dual_collider_color(color:Color):
	for node in get_tree().get_nodes_in_group("dual_collider"):
		var material = StandardMaterial3D.new()
		material.albedo_color = color
		node.set_material_override(material)

func change_group_nodes_alpha(group, alpha:float, color):
	for node in get_tree().get_nodes_in_group(group):
		var material = StandardMaterial3D.new()
		material.albedo_color = color
		material.albedo_color.a = alpha
		material.set_transparency(BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS)
		node.set_material_override(material)

func change_world(): 
	if curr_world == WORLDS.LIGHT:
		$WorldEnvironment.environment.set_bg_color(Color("bababaff"))
		change_group_nodes_alpha("light_collider", 0.5, Color(255,255,255))
		change_group_nodes_alpha("dark_collider", 1, Color(0,0,0))
		
		player_change_collision(2, true)
		player_change_collision(1, false)
		
		change_dual_collider_color(Color(0.18, 0.18, 0.18, 1.0))
		curr_world = WORLDS.DARK
	else:
		$WorldEnvironment.environment.set_bg_color(Color("3b3b3bff"))
		change_group_nodes_alpha("light_collider", 1, Color(255,255,255))
		change_group_nodes_alpha("dark_collider", .5, Color(0,0,0))
		
		player_change_collision(1, true)
		player_change_collision(2, false)
		
		change_dual_collider_color(Color(0.617, 0.617, 0.617, 1.0))
		curr_world = WORLDS.LIGHT

func reset():
	curr_world = WORLDS.LIGHT
	
	$WorldEnvironment.environment.set_bg_color(Color("3b3b3bff"))
	change_group_nodes_alpha("light_collider", 1, Color(255,255,255))
	change_group_nodes_alpha("dark_collider", .5, Color(0,0,0))
	
	player_change_collision(1, true)
	player_change_collision(2, false)
	
	change_dual_collider_color(Color(0.617, 0.617, 0.617, 1.0))
	curr_world = WORLDS.LIGHT
	
	var level_index = curr_level - 1
	if level_index < len(level_spawn):
		Global.get_group_node("player").position = level_spawn[level_index]

func next_level():
	curr_level += 1
	for c in $world.get_children():
		c.queue_free()
	
	var level = load("res://scenes/levels/level_" + str(curr_level) + ".tscn").instantiate()
	$world.add_child(level)
	reset()

func _physics_process(_delta):
	if Global.input_once("interact"):
		change_world()

func _on_reset_area_body_entered(body):
	if body.is_in_group("player"):
		reset()

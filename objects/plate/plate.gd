@tool
extends Area3D
signal pressed(entity)
signal depressed(entity)

enum ENTITIES { PLAYER, BOX, BOTH }
@export var entity : ENTITIES = ENTITIES.BOX
@export var color : Color = Color("ee7a77")

func _ready():
	var material = StandardMaterial3D.new()
	material.albedo_color = color
	material.shading_mode = material.SHADING_MODE_UNSHADED
	$MeshInstance3D2.set_material_override(material)
	
func _on_body_entered(body):
	if body.is_in_group("box") and (entity == ENTITIES.BOX or entity == ENTITIES.BOTH):
		pressed.emit(body)
	if body.is_in_group("player") and (entity == ENTITIES.PLAYER or entity == ENTITIES.BOTH):
		pressed.emit(body)

func _on_body_exited(body):
	depressed.emit(body)

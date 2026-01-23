extends CharacterBody3D

@export var speed: float = 220
@export var look_sensitivity: float = 0.2

var can_move = true
var mouse_delta := Vector2.ZERO

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		mouse_delta = event.relative * look_sensitivity

func _physics_process(delta):
	$Camera3D.rotation_degrees.y -= mouse_delta.x
	$Camera3D.rotation_degrees.x -= mouse_delta.y 
	$Camera3D.rotation_degrees.x = clamp($Camera3D.rotation_degrees.x, -50, 40)
	mouse_delta = Vector2.ZERO 
	
	var direction = Vector3.ZERO
	if can_move:
		if Global.input("forward"):
			direction -= $Camera3D.transform.basis.z 
		if Global.input("backward"):
			direction += $Camera3D.transform.basis.z
		if Global.input("left"):
			direction -= $Camera3D.transform.basis.x
		if Global.input("right"):
			direction += $Camera3D.transform.basis.x
		
		#if Global.input("forward") or Global.input("backward") or Global.input("left") or Global.input("right"):
			#$model/AnimationPlayer.play("walk")
		#else:
			#$model/AnimationPlayer.play("RESET")
	
	if direction != Vector3.ZERO:
		direction = direction.normalized() * speed * delta
	
	velocity.x = direction.x
	velocity.z = direction.z

	move_and_slide()

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):  
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

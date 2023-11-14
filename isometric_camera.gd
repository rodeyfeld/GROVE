extends Node3D


const CAM_MOVE_SPEED = .1

func move_camera(delta):
	
	var input_vector = Vector3.ZERO
	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input_vector.z = Input.get_action_strength("down") - Input.get_action_strength("up")
	if input_vector != Vector3.ZERO:
			
		input_vector = input_vector.normalized()
		self.position.x += input_vector.x * CAM_MOVE_SPEED
		self.position.z += input_vector.z * CAM_MOVE_SPEED
	
func _physics_process(delta):
	move_camera(delta)
	




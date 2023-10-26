extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	
	if nav_agent.target_position:
		var dir = nav_agent.get_next_path_position()
		print(dir)
		velocity = dir.normalized()
	
	move_and_slide()



func _on_area_3d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	nav_agent.target_position = area.owner.global_position

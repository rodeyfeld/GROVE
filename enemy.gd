extends CharacterBody3D

@onready var nav_agent = $NavigationAgent3D
const SPEED = 2
const JUMP_VELOCITY = 4.5
@onready var targets:Dictionary = {}
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var curr_target:Area3D = null

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var target = get_target()
	
	if target and is_on_floor():
		nav_agent.target_position = target.owner.global_position
		var target_position = nav_agent.get_next_path_position()
		var direction = global_position.direction_to(target_position)
		velocity = direction * SPEED
	
	move_and_slide()


func get_target():
	if curr_target: return curr_target
	else:
		if len(targets.values()) > 0:
			curr_target = targets.values()[0]
	return null

func _on_area_3d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	targets[area_rid] = area

func _on_area_3d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	targets.erase(area_rid)

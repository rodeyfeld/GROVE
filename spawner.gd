extends Node3D


@onready var start_position = $Marker3D
@onready var timer = $Timer
const enemy_scene = preload("res://enemy.tscn")



func _on_timer_timeout():
	var enemy = enemy_scene.instantiate()
	enemy.position = start_position.position
	add_child(enemy)

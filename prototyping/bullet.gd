extends Node2D

# TODO - fix enemy_prototype
@export var enemy_prototype: Node2D
var bullet_speed = 100
var velocity = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	position += position.direction_to(enemy_prototype.position) * bullet_speed

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemies"):
		area.explode()
		queue_free()
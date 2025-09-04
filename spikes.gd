extends Area2D

@export var respawn_point: NodePath  # drag Marker2D here in Inspector


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:  # only affect the player
		var marker = get_node(respawn_point)
		body.global_position = marker.global_position
		body.velocity = Vector2.ZERO  # stop player movement

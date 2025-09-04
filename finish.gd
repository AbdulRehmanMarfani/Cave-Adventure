extends Area2D

@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D") and (game_manager.points == 4):
		get_tree().change_scene_to_file("res://End.tscn")

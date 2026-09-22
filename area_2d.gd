extends Area2D


@export var winscene: PackedScene


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_packed(winscene)

extends Node2D

@export var dialog_id := ""

func get_dialog_id() -> String:
	return dialog_id

func _ready() -> void:
	add_to_group("npc")

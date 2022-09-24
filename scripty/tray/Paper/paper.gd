extends Node2D

func _ready():
	var note_resource = load("res://Scenes/Notice.tscn")
	var note_instance = note_resource.instance()
	add_child(note_instance)
	get_node("Notice").create(0,"This feature is coming in the 'pre-alpha please more papers update'  \n This feature is coming in the 'pre-alpha basic plot update'")

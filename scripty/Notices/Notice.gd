extends Node2D

func create(type,text):
	$icon.set_frame(type)
	$text.set_text(str(text))

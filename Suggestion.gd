extends Node2D

#-848

func _ready():
	pass
	#print($text.get_font("font").get_string_size($text.text))

func create(id):
	var loc = get_position()
	set_position(Vector2(loc.x,(loc.y + (id*-24))))
	set_name("Suggestion "+str(id))
	pass

func edit(text,used):
	$text.set_text(text)
	resize()

func resize():
	var Len = ($text.get_font("font").get_string_size($text.text) )[0]
	#print(str(Len))
	$mid.set_frame(Len)
	$end.set_position(Vector2(0+Len,4))
	if Len == 0:
		$front.hide()
		$end.hide()
	else:
		$front.show()
		$end.show()

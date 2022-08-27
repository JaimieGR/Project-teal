extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var dynamic_font = DynamicFont.new()
	dynamic_font.font_data = load("res://fonts/farsi.ttf")

	var label = RichTextLabel.new()
	label.bbcode_enabled = true
	label.set("normal_font", font)
	label.set()

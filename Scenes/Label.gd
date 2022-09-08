extends Label

var bitmapFont: BitmapFont

func _ready():
	bitmapFont = BitmapFont.new()
	bitmapFont.add_texture(preload("res://fonts/fontPNG.png"))
	bitmapFont.height = 8
	for i in range (290,1000):
		print(str(i) + " = " + char(i))
	#add_char ( int character, int texture, Rect2 rect, Vector2 align=Vector2( 0, 0 ), float advance=-1 )
	bitmapFont.add_char(65,  0, Rect2(1,0,4,7)  ,Vector2(0,0),6)# 65 = A,
	bitmapFont.add_char(97,  0, Rect2(1,0,4,7)  ,Vector2(0,0),6)# 97 = a,
	bitmapFont.add_char(65,  0, Rect2(6,0,9,7)  ,Vector2(0,0),6)# 66 = B,
	bitmapFont.add_char(98,  0, Rect2(6,0,9,7)  ,Vector2(0,0),6)# 98 = b,

	#theme = Theme.new()
	#theme.default_font = bitmapFont

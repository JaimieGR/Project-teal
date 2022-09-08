extends Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
var change = -10000000000000
func _process(delta):
	var loc = self.get_global_position()
	if change != loc.x:
		print(str(loc))
		change = loc.x




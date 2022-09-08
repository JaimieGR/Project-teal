extends Node2D
var trayNumUp = 4
var trayNumDwn = -3
var tray = 0
var speedDelta = 95 #570/2 #3* #30
#Hence, the factors of 1710 are
#1, 2, 3, 5, 6, 9, 10, 15, 18, 19, 30, 38, 45, 57,
#90, 95, 114, 171, 190, 285, 342, 570, 855, 1710.
var speedGamma = 3
var Maxxing = false

func _ready():
	pass



func _process(delta):
	var Xpos = get_position().x
	var Xtraypos = 570*tray*3
	#print(str(Xtraypos))
	if (Xpos == (-1*Xtraypos)): #frozen
		pass
		#print ("home")


	else: #move
		if Xpos > -1*Xtraypos: #right
			var newpos = Vector2(Xpos-speedDelta,get_position().y)
			self.set_position(newpos)
		else: #left
			var newpos = Vector2(Xpos+speedDelta,get_position().y)
			self.set_position(newpos)


	if (Input.is_action_just_released("right")):
		if tray+1 == trayNumUp+1: # max up
			tray = trayNumDwn
			print("MAX OUT-Up")
			self.set_position(Vector2(0,get_position().y))
			self.set_position(Vector2(570*-(tray)*3,get_position().y))
		else:
			tray = tray+1
			print("+1")

	if (Input.is_action_just_released("left")):
		if tray-1 == trayNumDwn-1: # max down
			tray = trayNumUp
			print("MAX OUT-Dwn")
			self.set_position(Vector2(0,get_position().y))
			self.set_position(Vector2(570*-(tray)*3,get_position().y))
		else:
			tray = tray-1
			print("-1")

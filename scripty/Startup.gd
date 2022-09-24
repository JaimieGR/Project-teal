extends Node2D

var running

func _ready():

	running = true
	#Godot
	$Godot.show()
	yield(get_tree().create_timer(3), "timeout")
	$Godot.hide()
	#NightVision
	$Night.show()
	for i in range(0,29):
		$Night.set_frame(i)
		yield(get_tree().create_timer(0.075), "timeout")
	$Night.set_frame(30)
	yield(get_tree().create_timer(0.3), "timeout")
	$Night.set_frame(31)
	yield(get_tree().create_timer(2), "timeout")
	$Night.set_frame(32)
	yield(get_tree().create_timer(4), "timeout")
	$Night.hide()
	#Cola
	$Cola/name.set_position(Vector2(-110,0))
	$Cola.show()
	for i in range(0,110):
		print("loc: " + str($Cola/name.get_position().x) )
		$Cola/name.set_position(Vector2($Cola/name.get_position().x +1,0))
		yield(get_tree().create_timer(0.005), "timeout")
	#Nameplate
	running = false
	pass

func end():
	if !running:
		print("finished")

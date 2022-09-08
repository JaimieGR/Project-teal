extends Node

var player_info = {
	name = "Player  Alpha-Alpha",      # How this player will be shown within the GUI
	net_id = 1,                        # By default everyone receives "server ID"
	actor_path = "res://player.tscn",  # The class used to represent the player in the game world
	char_color = Color(1, 1, 1)        # By default don't modulate the icon color
}

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

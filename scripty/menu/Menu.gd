extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#Network.connect("player_list_changed", self, "_on_player_list_changed")
	pass
	#$Players/PanelPlayerList/lblLocalPlayer.text = Gamestate.player_info.name
"""
func _on_player_list_changed():
	# First remove all children from the boxList widget
	for c in $Players/PanelPlayerList/boxList.get_children():
		c.queue_free()

	# Now iterate through the player list creating a new entry into the boxList
	for p in Network.players:
		if (p != Gamestate.player_info.net_id):
			var nlabel = Label.new()
			nlabel.text = Network.players[p].name
			$Players/PanelPlayerList/boxList.add_child(nlabel)
"""

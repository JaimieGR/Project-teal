extends Node



var path = []
var branch = []
var line = "00"
var sugg = []

var tree

func _ready():
	for i in range(0,10):
		var sugg_resource = load("res://Scenes/SuggestionSystem/Suggestion.tscn")
		var sugg_instance = sugg_resource.instance()
		add_child(sugg_instance)
		get_node("Suggestion").create(i)

		sugg.append( get_node("Suggestion " + str(i)) )
		sugg[i].edit("","")
	#print (str(sugg) )
	tree = [
	word("set", [
		word("heading",[
			word("away",[]),
			word("to",[]),
			word("toward",[])
			]),
		word("depth",[]),
		word("course",[
			word("away",[]),
			word("to",[]),
			word("toward",[])
			])
		]),
	word("emergency",[
		word("stop",[]),
		word("blow",[])
		]),
	word("search",[])
	]
	#print("WORD MAP ---->")
	#print(" ")
	for i in range(tree.size()):
		pass
		#tree[i].Print("")
	#print(" ")
	#print("<----END MAP")
	branch = tree

func run(word,new):
	var NewSugg = []
	print("word: " + word + " and is it new "+ str(new) + "and the branch is " + str(branch.size()) + " long" )
	if new:
		branch = tree
		return
	for i in range (branch.size() ):
		#branch[i].Print("*")
		var out = branch[i].scan(word)
		if out[0] == true:
			NewSugg.append(out[1])
	for i in range(0,10):
		sugg[i].edit("","null")
	for i in range(NewSugg.size()):
		sugg[i].edit(NewSugg[i],"null")
	if NewSugg.size() == 1:
		print("MatchFound")
		get_parent().Match(true,NewSugg[0])
	else:
		pass
		#get_parent().Match(false,NewSugg[0])


func word(Name,children):
	var obj = Section.new()
	obj.create(Name,children)
	return obj

extends Node

class_name Section

var children = []
var type = "" # one of "word" or "angle" or something else
var word = "" #the word, if the type is "word"
var Name = ""

func create(Name,children):
	self.children = children
	self.Name = Name.to_upper()

func Print(pin):
	print(pin+Name)
	pin = pin+"-"
	for i in range(children.size()):
		children[i].Print(pin)

func ReturnChild():
	return children

func scan(word):
	#print("scanning>>>")
	var out = [false,Name]
	print ("does " + Name + " contain " + word)
	if (Name.find(word,0) ) == 0:
		out[0] = true
	return out

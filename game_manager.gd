extends Node
@onready var label: Label = %Label

var points = 0 
func add_points():
	points += 1
	print(points)
	label.text = "Points: " + str(points)

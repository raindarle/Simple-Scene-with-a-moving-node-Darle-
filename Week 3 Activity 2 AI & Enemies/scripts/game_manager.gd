extends Node

var score = 0

@onready var score_label: Label = $Player/ScoreLabel



func add_point():
	score += 1
	print(score)
	score_label.text = " You have " + str(score) + " coin/s! "

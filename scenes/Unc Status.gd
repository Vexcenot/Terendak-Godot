extends Node2D

func _ready():
	intro()

func intro():
	Dialogic.start("intro")

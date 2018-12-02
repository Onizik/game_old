extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass

func _process(delta):
	if position.y < 400:
		position.y += 150 * delta

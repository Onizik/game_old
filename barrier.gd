extends Node2D

var velocity = Vector2(0, 100)

func _ready():
	pass

func _process(delta):
	self.position += velocity * delta
	var screen_height = ProjectSettings.get_setting("display/window/size/height")
	if self.position.y > screen_height:
		queue_free()

extends Node2D

var velocity = Vector2(0, 150)

func _ready():
	var anim = str(randi() % 7 + 1)
	$anim.play(anim)

func _process(delta):
	self.position += velocity * delta
	var screen_height = ProjectSettings.get_setting("display/window/size/height")
	if self.position.y > screen_height or self.position.y == -1000:
		queue_free()

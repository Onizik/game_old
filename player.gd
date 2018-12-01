extends Node2D

var speed = 400
var screen_height
var screen_width
var player_size

var unit = preload("res://unit.tscn")

func _ready():
	screen_height = ProjectSettings.get_setting("display/window/size/height")
	screen_width = ProjectSettings.get_setting("display/window/size/width")
	player_size = $sprite.texture.get_size() * $sprite.scale
	generate_unit()
	
func _process(delta):
	move(delta)

func move(delta):
	var direction = Vector2()
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	position += direction.normalized() * delta * speed

func generate_unit():
	var new_unit = unit.instance()
	new_unit.position = position * 2
	new_unit.center = position
	add_child(new_unit)

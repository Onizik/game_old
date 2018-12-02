extends Node2D

signal push(absolute_position)

var speed = 400
var screen_height
var screen_width
var player_size
var units = []

var unit = preload("res://unit.tscn")

func _ready():
	screen_height = ProjectSettings.get_setting("display/window/size/height")
	screen_width = ProjectSettings.get_setting("display/window/size/width")
	for i in range(20):
		generate_unit()
	
func _process(delta):
	move(delta)
	get_tree().get_root().get_node("root/label").text = "units : " + str(units.size())

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
	if Input.is_action_just_pressed("ui_select"):
		push_unit()
	
	position += direction.normalized() * delta * speed

func generate_unit():
	var new_unit = unit.instance()
	new_unit.position = Vector2(0, 0)
	new_unit.center = Vector2(0, 0)
	units.append(new_unit)
	add_child(new_unit)

func push_unit():
	if units.size() > 0:
		var current_unit = units.pop_front()
		emit_signal("push", position + current_unit.position)
		current_unit.queue_free()
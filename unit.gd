extends Node2D

var center
var attack_speed = 600
var normal_speed = 100
var max_length = 80

var normal_state = 0
var attack_state = 1
var wait_state = 2
var dead_state = 3
var current_state = normal_state

var wait_time = 10

var current_direction = Vector2(randf() -0.5, randf() -0.5)
var current_direction_time = 0

var max_direction_time = 0.8

func _ready():
	pass

func _process(delta):
	if current_state == normal_state:
		normal_moving(delta)
	elif current_state == attack_state:
		position.y -= 800 * delta
		if position.y < -200 or position.y > 900:
			queue_free()
	elif current_state == wait_state:
		wait_moving(delta)
	elif current_state == dead_state:
		dead_moving(delta)

func normal_moving(delta):
	if current_direction_time > max_direction_time:
		current_direction_time = 0
		current_direction.x = generate_random()
		current_direction.y = generate_random()
	current_direction_time += delta
	position += current_direction * normal_speed * delta

	if center.distance_to(position) > max_length:
		current_direction = -current_direction
		current_direction = center - position
		current_direction = current_direction.normalized()

func wait_moving(delta):
	if wait_time >= 0:
		wait_time -= delta
		position.y += 10 * delta * wait_time

func dead_moving(delta):
	var screen_height = ProjectSettings.get_setting("display/window/size/height")
	position.y += 160 * delta
	if position.y > screen_height:
		queue_free()

func generate_random():
	var random = (randi() % 2)
	if random == 0:
		random = -1
	return random

func _on_body_body_entered(body):
	print(body.get_name())
	if current_state == attack_state and body.get_name()[1] == "b":
		body.mode = body.MODE_RIGID 
		current_state = wait_state
	if current_state == wait_state and body.get_name() == "player":
		get_tree().get_root().get_node("root/player").generate_unit()
		queue_free()
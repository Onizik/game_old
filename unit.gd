extends Node2D

var center
var attack_speed = 600
var normal_speed = 100
var max_length = 80

var normal_state = 0
var attack_state = 1
var current_state = normal_state

var current_direction = Vector2(randf() -0.5, randf() -0.5)
var current_direction_time = 0

var max_direction_time = 0.2

func _ready():
	pass

func _process(delta):
	if current_state == normal_state:
		normal_moving(delta)
	elif current_state == attack_state:
		position.y -= 800 * delta
		if position.y < -200:
			queue_free()

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



func generate_random():
	var random = (randi() % 2)
	if random == 0:
		random = -1
	return random
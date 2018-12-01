extends Node2D

export (Vector2) var center
var attack_speed = 600
var normal_speed = 80
var max_length = 200

var normal_state = 0
var attack_state = 1
var current_state = normal_state

var current_direction = Vexctor2()

func _ready():
	pass

func _process(delta):
	normal_moving(delta)

func normal_moving(delta):
	var direction = Vector2()
	direction.x = randf() -0.5
	direction.y = randf() -0.5
	position += direction * normal_speed * delta
	
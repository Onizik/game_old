extends Node2D

var time = 120
var default_generate_time = 2
var generate_time = 0

var unit = preload("res://unit.tscn")
var barrier = preload("res://barrier.tscn")

var portal = preload("res://portal.tscn")
var exitst_portal = false

func _ready():
	pass

func _process(delta):
	time -= delta
	generate_time -= delta
	if time >= 0:
		if generate_time <= 0:
			var rand = randi() % 8
			if rand == 0:
				generate1()
			elif rand == 1:
				generate2()
			elif rand == 2:
				generate3()
			elif rand == 3:
				generate4()
			elif rand == 4:
				generate5()
			elif rand == 5:
				generate6()
			elif rand == 6:
				generate7()
			generate_1()
			generate_2()
			generate_time = default_generate_time
	elif not exitst_portal:
		generate_portal()
		exitst_portal = true

func generate_portal():
	var new_portal = portal.instance()
	add_child(new_portal)

func generate_1():
	var new_barrier = barrier.instance()
	new_barrier.position.y = -60
	new_barrier.position.x = 20
	add_child(new_barrier)
	
func generate_2():
	var new_barrier = barrier.instance()
	new_barrier.position.y = -20
	new_barrier.position.x = 780
	add_child(new_barrier)

func generate1():
	for i in range(15):
		var new_barrier = barrier.instance()
		new_barrier.position.y = -20 * i
		new_barrier.position.x = 800 - 50 * (i + 1)
		add_child(new_barrier)

func generate2():
	for i in range(4):
		var new_barrier = barrier.instance()
		new_barrier.position.y = 0
		new_barrier.position.x = 850 - 200 * (i + 1)
		add_child(new_barrier)

func generate3():
	for i in range(3):
		var new_barrier = barrier.instance()
		new_barrier.position.y = 0
		new_barrier.position.x = 800 - 200 * (i + 1)
		add_child(new_barrier)

func generate4():
	for i in range(15):
		var new_barrier = barrier.instance()
		new_barrier.position.x = 800 - 50 * (i + 1)
		new_barrier.position.y = -(i + 1) * (i + 1) * 3
		add_child(new_barrier)
		
func generate5():
	for i in range(6):
		var new_barrier = barrier.instance()
		new_barrier.position.x = 120 * (i + 1)
		new_barrier.position.y = -(i + 1) * (i + 1) * 3
		add_child(new_barrier)

func generate6():
	for i in range(6):
		var new_barrier = barrier.instance()
		new_barrier.position.x = 120 * (i + 1)
		new_barrier.position.y = -(i + 1) * (i + 1) * 12
		add_child(new_barrier)
		
func generate7():
	for i in range(6):
		var new_barrier = barrier.instance()
		new_barrier.position.x = 120 * (i + 1)
		new_barrier.position.y = sin(i) * 60
		add_child(new_barrier)


func _on_player_push(absolute_position):
	var new_unit = unit.instance()
	new_unit.position = absolute_position
	new_unit.current_state = new_unit.attack_state
	new_unit.get_node("_body").contact_monitor = true
	add_child(new_unit)


func _on_player_dead_unit(absolute_position):
	var new_unit = unit.instance()
	new_unit.position = absolute_position
	new_unit.current_state = new_unit.dead_state
	add_child(new_unit)


extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var unit = preload("res://unit.tscn")
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_player_push(absolute_position):
	var new_unit = unit.instance()
	new_unit.position = absolute_position
	new_unit.current_state = new_unit.attack_state
	new_unit.get_node("_body").contact_monitor = true
	add_child(new_unit)

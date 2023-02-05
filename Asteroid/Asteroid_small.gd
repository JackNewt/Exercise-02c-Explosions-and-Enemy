extends KinematicBody2D

var health = 1
var velocity = Vector2.ZERO

var Effects
onready var Explosion = load("res://Assets/Explosion.tscn")

func _physics_process(_delta):
	position += velocity
	position.x = wrapf(position.x,0,1024)
	position.y = wrapf(position.x,0,600)
	
func damage(d):
	health -= d
	if health <= 0:
		Effects = get_node_or_null("res://Assets/Effects/")
		if Effects != null:
			var explosion = Explosion.instance()
			Effects.add_child(explosion)
			explosion.global_position = global_position
		queue_free()

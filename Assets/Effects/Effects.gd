extends AnimatedSprite


func _ready():
	play("Explosion")


func _on_Explosion_animation_finished():
	queue_free()

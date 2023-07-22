extends Node

func _ready():
	$WinScreen.hide()
	$Player.init($StartPosition.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_dungeon_trapdoor_entered():
	$Player.is_started = false
	$Player/AnimatedSprite2D.stop()
	$HUD.hide()
	$WinScreen.show()
	$BackgroundMusic/FadeOutMusic.play("FadeOutMusic")

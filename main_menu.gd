extends CanvasLayer

@export var game_scene: PackedScene
var game: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$Credits.hide()
	$BackButton.hide()


func _on_start_button_pressed():
	$ColorRect.hide()
	$Title.hide()
	$VBoxContainer.hide()
	game = game_scene.instantiate()
	game.get_node("./WinScreen").back_to_menu.connect(_on_back_to_menu_pressed)
	
	get_tree().root.add_child(game)

func _on_back_to_menu_pressed():
	get_tree().root.remove_child(game)
	$ColorRect.show()
	$Title.show()
	$VBoxContainer.show()
	game.queue_free()


func _on_credits_button_pressed():
	$Title.hide()
	$VBoxContainer.hide()
	$Credits.show()
	$BackButton.show()


func _on_back_button_pressed():
	$VBoxContainer.show()
	$Credits.hide()
	$BackButton.hide()

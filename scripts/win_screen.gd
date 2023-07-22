extends CanvasLayer

signal back_to_menu

func _on_back_button_pressed():
	back_to_menu.emit()

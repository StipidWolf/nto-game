extends CanvasLayer

func _ready() -> void:
	self.visible = false
	$PauseMenu.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed('Esc'):
		$Button.button_pressed = true

func _on_button_pressed() -> void:
	$PauseMenu.visible = true
	get_tree().paused = true


func _on_return_button_pressed() -> void:
	get_tree().paused = false
	$PauseMenu.visible = false


func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

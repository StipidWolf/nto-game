extends CanvasLayer

@export var canvas_mod: CanvasModulate
@export var next_scene: PackedScene
@export var ingame_canvas: CanvasLayer

func _ready() -> void:
	self.visible = true

func _on_button_settings_pressed() -> void:
	$AnimationPlayer.play("menuFLowIn")



func _on_button_exit_pressed() -> void:
	$AnimationPlayer.play("menuFlowOut")


func _on_button_apply_pressed() -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index('Music'), $Settings/VBoxContainer/HSlider.value/$Settings/VBoxContainer/HSlider.max_value)
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index('SFX'), $Settings/VBoxContainer/HSlider2.value/$Settings/VBoxContainer/HSlider2.max_value)
	if canvas_mod:
		var val = $Settings/VBoxContainer/HSlider3.value/$Settings/VBoxContainer/HSlider3.max_value/2 + 0.5
		canvas_mod.color = Color(val, val, val, 1)


func _on_button_play_pressed() -> void:
	if next_scene:
		var scene = next_scene.instantiate()
		add_sibling(scene)
	self.visible = false
	if ingame_canvas:
		ingame_canvas.visible = true
	

class_name PrototypeClicker
extends View
## A clicker prototype creating stardust.


## Initialize visibility at launch.
func _ready() -> void:
	super()
	visible = false


## Create 1 stardust.
func create_stardust() -> void:
	HandlerStardust.ref.trigger_clicker()


## Triggered when the stardust button is pressed
func _on_button_pressed() -> void:
	create_stardust()

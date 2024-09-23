class_name PrototypeGenerator
extends View
## Generator prototype creating stardust every seconds.


## Reference to the button starting the generation.
@export var button : Button
## Reference to the timer.
@export var timer : Timer


## Initialize visibility at launch.
func _ready() -> void:
	super()
	visible = true



## Create stardust and store it.
func create_stardust() -> void:
	HandlerStardust.ref.create_stardust(1)


## Start the timer and disable the button.
func begin_generating_stardust() -> void:
	timer.start()
	button.disabled = true

## Triggered when the "begin generating" button is pressed.
func _on_button_pressed() -> void:
	begin_generating_stardust()

## Triggered when the timer times out.
func _on_timer_timeout() -> void:
	create_stardust()

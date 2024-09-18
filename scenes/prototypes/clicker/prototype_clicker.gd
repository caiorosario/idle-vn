class_name PrototypeClicker
extends Control
## A clicker prototype creating stardust.


## View reference.
@export var view : UserInterface.Views
## Reference to the user interface
@export var user_interface : UserInterface


## Initialize the label at launch.
func _ready() -> void:
	visible = false
	
	user_interface.navigation_requested.connect(_on_navigation_request)


## Create 1 stardust.
func create_stardust() -> void:
	HandlerStardust.ref.create_stardust(1)


## Triggered when the stardust button is pressed
func _on_button_pressed() -> void:
	create_stardust()

## Watch for navigation requests and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views) ->void:
	if requested_view == view:
		visible = true
		return
	
	visible = false

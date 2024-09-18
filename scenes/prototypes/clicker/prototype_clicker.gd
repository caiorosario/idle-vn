class_name PrototypeClicker
extends Control
## A clicker prototype creating stardust.


## Reference to the label displaying current amount of stardust.
@export var label : Label
## View reference.
@export var view : UserInterface.Views
## Reference to the user interface
@export var user_interface : UserInterface


## Initialize the label at launch.
func _ready() -> void:
	update_label_text()
	
	user_interface.navigation_requested.connect(_on_navigation_request)

## Temporary func to update label
func _process(_delta: float) -> void:
	update_label_text()

## Create 1 stardust.
func create_stardust() -> void:
	Game.ref.data.stardust += 1

## Update the text of the label to reflect a change in stardust amount.
func update_label_text() ->void:
	label.text = "Stardust : %s" %Game.ref.data.stardust

## Triggered when the stardust button is pressed
func _on_button_pressed() -> void:
	create_stardust()

## Watch for navigation requests and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views) ->void:
	if requested_view == view:
		visible = true
		return
	
	visible = false

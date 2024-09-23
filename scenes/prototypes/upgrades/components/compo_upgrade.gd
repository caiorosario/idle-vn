class_name CompoUpgrade
extends Control
## Component displaying an upgrade.


## Reference to the title label.
@export var label_title : Label
## Reference to the Rich text label description
@export var label_description : RichTextLabel
## Reference to the purchase button.
@export var button : Button


## Upgrade to display.
var upgrade : Upgrade


func _ready() -> void:
	upgrade = Up01ClickerUpgrade.new()
	
	update_lable_title()
	update_label_description()
	update_button()
	
	HandlerStardust.ref.stardust_created.connect(update_button)
	HandlerStardust.ref.stardust_consumed.connect(update_button)
	
	upgrade.leveled_up.connect(update_lable_title)
	upgrade.leveled_up.connect(update_label_description)
	upgrade.leveled_up.connect(update_button)


## Updates the title of the upgrade.
func update_lable_title() -> void:
	var text : String = upgrade.title + "    Level : %s" %upgrade.level
	label_title.text = text


## Updates the description of the upgrade
func update_label_description() -> void:
	label_description.text = upgrade.description()

## Updates the button availability.
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return
	
	button.disabled = true
	
	

## Triggered when purchase button is pressed.
func _on_purchase_button_pressed() -> void:
	upgrade.level_up()

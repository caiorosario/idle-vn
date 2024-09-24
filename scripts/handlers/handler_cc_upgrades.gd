class_name HandlerCCUpgrades
extends Node
## Manages Consciousness Cores Upgrades

## Singleton reference
static var ref : HandlerCCUpgrades


## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()


## Emitted when an upgrade has leveled up.
@warning_ignore("unused_signal")
signal upgrade_leveled_up(upgrade : Upgrade)

## Reference to CCUpgrade 01.
@onready var u_01_stardust_generation : CCU01StardustGenerator = CCU01StardustGenerator.new()

## Returns all CCUpgrades.
func get_all_upgrades() -> Array[Upgrade]:
	return [
		u_01_stardust_generation,
	]

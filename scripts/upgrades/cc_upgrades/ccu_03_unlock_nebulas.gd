class_name CCU03UnlockNebulas
extends Upgrade
## CCUpgrade 03 : Unlocks Nebulas.

## Max level.
var max_level : int = 1

## Initialize values.
func _init() -> void:
	level = Game.ref.data.cc_upgrades.u_03_unlock_nebulas
	title = "Unlock Nebulas"
	base_cost = 5
	cost = 5



## Returns the description of your upgrade
func description() -> String:
	var text : String = "[b]Effects :[/b] Unlock the ability to create Nebulas."
	
	if level < max_level:
		text += "\n[b]Cost :[/b] %s Consciousness Cores" %cost
	
	return text




## Returns whether or not the player can afford buying upgrade
func can_afford() -> bool:
	if level >= max_level:
		return false
	
	if Game.ref.data.consciousness_core >= cost:
		return true
	
	return false


## Consumes Consciousness Cores to level up.
func level_up() -> void:
	if level >= max_level:
		return
	
	var error : Error = HandlerConsciousnessCore.ref.consume_consciousness_core(cost)
	
	if error:
		return
	
	level += 1
	Game.ref.data.cc_upgrades.u_03_unlock_nebulas = true
	
	leveled_up.emit()
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)

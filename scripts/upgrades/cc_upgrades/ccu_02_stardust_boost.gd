class_name CCU02StardustBoost
extends Upgrade
## CCU02 Upgrade : Increases the amount of stardust generated per second


## Max Level.
var max_level : int = 5


## Initialize values.
func _init() -> void:
	level = Game.ref.data.cc_upgrades.u_02_stardust_boost_level
	title = "Stardust Generator Efficiency"
	base_cost = 1
	cost = 1

## Returns the description of your upgrade
func description() -> String:
	var text : String = "Increase the amount of Stardust generated by the Universe Core."
	text += "\n[b]Effects :[/b] +1 stardust / sec."
	
	if level < max_level:
		text +="\n[b]Cost :[/b] %s Consciousness Cores" %cost
	return text


## Returns whether or not the player can afford buying upgrade
func can_afford() -> bool:
	if level >=max_level:
		return false
	
	if Game.ref.data.consciousness_core >= cost:
		return true
	
	return false


## Consumes consciousness cores to level up.
func level_up() -> void:
	if level >= max_level:
		return
	
	var error : Error = HandlerConsciousnessCore.ref.consume_consciousness_core(cost)
	
	if error:
		return
	
	level += 1
	Game.ref.data.cc_upgrades.u_02_stardust_boost_level = level
	
	leveled_up.emit()
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)

class_name HandlerConsciousnessCore
extends Node
## Manages Consciousness Cores and related signals.

## Singleton reference
static var ref : HandlerConsciousnessCore


## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()

## Emitted when consciousness cores has been created
signal consciousness_core_created(quantity : int)

## Emitted when consciousness cores has been consumed
signal consciousness_core_consumed(quantity : int)

## Returns the current amount of consciousness cores available.
func consciousness_core() -> int:
	return Game.ref.data.consciousness_core

## Create a specific amount of consciousness cores.
func create_consciousness_core(quantity : int) -> void:
	Game.ref.data.consciousness_core += quantity
	consciousness_core_created.emit(quantity)

## Consume a specific amount of consciousness cores.
func consume_consciousness_core(quantity : int) -> Error:
	if quantity > Game.ref.data.consciousness_core:
		return Error.FAILED
	
	Game.ref.data.consciousness_core -= quantity
	consciousness_core_consumed.emit(quantity)
	
	return Error.OK

## Triggered by the clicker; creates consciousness cores
func trigger_clicker() -> void:
	var quantity : int = 1
	quantity += Game.ref.data.up_01_level
	
	create_consciousness_core(quantity)

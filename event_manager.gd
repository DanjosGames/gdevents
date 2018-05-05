extends Node

class EventListener extends Node:
	var _event
	var _callback
	
	func _init(event, callback):
		self._event = event
		self._callback = callback

func add_listener(_event, _node, _funcname):
	var el = EventListener.new(_event, funcref(_node, _funcname))
	add_child(el)
	_node.connect("tree_exiting", el, "queue_free")

func trigger_event(_event):
	for el in get_children():
		if el._event == _event:
			el._callback.call_func()
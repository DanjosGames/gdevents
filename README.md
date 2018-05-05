# GDEvents
An alternative approach to Godot's built-in signals.
It allows you to listen for any string named event you want, anywhere in your project, and raise that event anywhere else, without the listener needing to know about the emitter, and visa versa.
## Installing
Just copy `event_manager.gd` into your project and add it as a global singleton via autoload.
## Usage
To trigger an event:
```
event_manager.trigger_event("my_event")
```
To listen to an event:
```
event_manager.add_listener("my_event", self, "_on_my_event"
```
## Example
_listener.gd:_
```
extends Node

func _ready():
	event_manager.add_listener("test_event", self, "_on_test_event")

func _on_test_event():
	print("RECEIVED EVENT!!!!")
```

_emitter.gd:_
```
extends Node

func _input(event):
	if event.is_action_pressed("ui_select"):
		event_manager.trigger_event("test_event")
```
extends Node
class_name SkillPlayer

# ======================================
# Properties
# ======================================

onready var _pomodoro = $Pomodoro

# ======================================
# Overrides
# ======================================

func _ready() -> void:
	_pomodoro.connect("work_session_finished", self, "_work_finished")
	_pomodoro.connect("short_break_session_finished", self, "_short_break_finished")
	_pomodoro.connect("long_break_session_finished", self, "_long_break_finished")
	
# ======================================
# Private
# ======================================
	
func _work_finished() -> void:
	pass

func _short_break_finished() -> void:
	# Give items (->O), upgrade items (I->I), or craft items (I->O) 
	pass
	
func _long_break_finished() -> void:
	pass

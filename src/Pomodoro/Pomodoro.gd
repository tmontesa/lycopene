extends Node
class_name Pomodoro

# ======================================
# Properties
# ======================================

signal work_session_finished
signal short_break_session_finished
signal long_break_session_finished

var _work_sessions : int = 3
var _remaining_work_sessions : int = _work_sessions
var _active_timer : Timer = null

# Time is in seconds
var _work_duration : int = 60 * 40 
var _short_break_duration : int = 60 * 10 
var _long_break_duration : int = 60 * 30

onready var _work_timer : Timer = $WorkTimer
onready var _short_break_timer : Timer = $ShortBreakTimer
onready var _long_break_timer : Timer = $LongBreakTimer

# ======================================
# Public
# ======================================

func set_work_sessions(n: int) -> void:
	_work_sessions = n
	
func set_work_duration(n: int) -> void:
	_work_duration = n
	
func set_short_break_duration(n: int) -> void:
	_short_break_duration = n

func set_long_break_duration(n: int) -> void:
	_long_break_duration = n
	
func start() -> void:
	_remaining_work_sessions = _work_sessions
	_active_timer = _work_timer
	_work_timer.start()

func pause() -> void:
	pass # TODO

func stop():
	pass # TODO
	
# ======================================
# Private
# ======================================

# Decrement after finishing work session, then check for remaining sessions.
# When session = 0, start long break. 
# After long break, reset remaining sessions and start cycle again. 

func _work_timer_finished() -> void:
	emit_signal("work_session_finished")
	_remaining_work_sessions -= 1
	
	if (_remaining_work_sessions > 0):
		_active_timer = _short_break_timer
		_short_break_timer.start()
	else:
		_active_timer = _long_break_timer
		_long_break_timer.start()

func _short_break_timer_finished() -> void:
	emit_signal("short_break_session_finished")
	_active_timer = _work_timer
	_work_timer.start()

func _long_break_timer_finished() -> void:
	emit_signal("long_break_session_finished")
	_remaining_work_sessions = _work_sessions
	_active_timer = _work_timer
	_work_timer.start()
	

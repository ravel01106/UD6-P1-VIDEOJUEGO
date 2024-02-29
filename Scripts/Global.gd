extends Node

signal killedEnemySignal(int)
signal resetCounterSignal(int)
var enemyKilledCount : int


func enemyKilled(number:int):
	enemyKilledCount = enemyKilledCount + number
	emit_signal("killedEnemySignal", number)

func resetCounter(number:int):
	enemyKilledCount = number
	emit_signal("resetCounterSignal")

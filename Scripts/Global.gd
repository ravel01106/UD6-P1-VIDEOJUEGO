extends Node

signal killedEnemySignal(int)
var enemyKilledCount : int


func enemyKilled(numerito:int):
	enemyKilledCount = enemyKilledCount + numerito
	emit_signal("killedEnemySignal", numerito)

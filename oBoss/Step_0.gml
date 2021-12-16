var playerDir = point_direction( x, y, oPlayer.x, oPlayer.y);
switch(currentState) {
	case enemyStates.idle:
		if (stateTimer == 0) {currentState = enemyStates.pick;}
		break;
	
	case enemyStates.pick:
		currentState = choose( enemyStates.spray, enemyStates.fan, enemyStates.swirl);
		stateTimer = timerData[currentState];
		bulletCount = 100;
		break;
		
	case enemyStates.spray:
		bulletCount--;
		createBullet( x, y, irandom(360), 4, 0);
		break;
		
	case enemyStates.fan:
		var fanSize = 5;
		var fanSpread = 15;
		if (stateTimer == 0 and bulletCount > 0) {
			stateTimer = timerData[currentState];
			bulletCount -= fanSize;
			for (var i  = -floor(fanSize/2); i < ceil(fanSize/2); i++) {
				createBullet( x, y, playerDir + i * fanSpread, 4, 0);
			}
		}
		break;
		
	case enemyStates.swirl:
		if (stateTimer == 0) { bulletCount = 0; break;}
		createBullet( x, y, playerDir + stateTimer, 10, 0);
		createBullet( x, y, playerDir + stateTimer - 15, 10, 0);
		createBullet( x, y, playerDir + stateTimer - 30, 10, 0);
		break;
}

if (stateTimer > 0) {
	stateTimer--;
}

if (bulletCount == 0) {
	bulletCount = -1;
	currentState = enemyStates.idle;
	stateTimer = timerData[currentState];
}
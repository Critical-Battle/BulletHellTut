global.bulletPool = ds_stack_create();

enum enemyStates {
	idle,
	pick,
	spray,
	fan,
	moveRight,
	swirl
}

timerData[enemyStates.swirl]	= 180;
timerData[enemyStates.moveRight]= 180;
timerData[enemyStates.fan]		= 30;
timerData[enemyStates.spray]	= -1;
timerData[enemyStates.pick]		= -1;
timerData[enemyStates.idle]		= 60;

bulletCount = 0;
currentState = enemyStates.idle;
stateTimer = timerData[currentState];
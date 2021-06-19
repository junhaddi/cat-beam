var key_jump = keyboard_check_pressed(vk_up) || global.isTouchs[Touch.Jump];
var key_beam = keyboard_check(vk_down) || global.isTouchs[Touch.Beam];

var distanceMax;
switch (global.tutorialIndex) {
	case Tutorial.BlockLow:
		if (key_jump) {
			global.isStop = false;
		}
		distanceMax = 240;
		break;
	case Tutorial.BlockHigh:
		if (key_jump) {
			global.isStop = false;
		}
		distanceMax = 480;
		break;
	case Tutorial.Enemy:
		if (key_beam) {
			global.isStop = false;
		}
		distanceMax = 800;
		break;
	case Tutorial.Ciao:
		distanceMax = -999999999;
		break;
	case Tutorial.Items:
		// 게임시작
		if (key_jump || key_beam) {
			global.isStop = false;
			global.gameState = GameState.InGame;
			instance_destroy();
		}
		break;
}

if (instance_exists(par_prop) && global.tutorialIndex <= Tutorial.Ciao) {
	var distance =  par_prop.x - obj_player.x;
	if (distance < distanceMax) {
		if (!global.isStop && !_isStop) {
			global.isStop = true;
			_isStop = true;
		}
	}
} else if (_isStop) {
	global.isStop = false;
	_isStop = false;
	alarm[++global.tutorialIndex] = GAME_FPS * 6;
	instance_destroy(obj_textBubble);
}

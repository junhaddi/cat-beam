var distanceMax;
switch (global.tutorialIndex) {
	case Tutorial.BlockLow:
		if (global.isInputs[Input.Jump]) {
			global.isStop = false;
		}
		distanceMax = 240;
		break;
	case Tutorial.BlockHigh:
		if (global.isInputs[Input.Jump]) {
			global.isStop = false;
		}
		distanceMax = 480;
		break;
	case Tutorial.Enemy:
		if (global.isInputs[Input.Beam]) {
			global.isStop = false;
		}
		distanceMax = 800;
		break;
	case Tutorial.Ciao:
		distanceMax = -999999999;
		break;
}

if (instance_exists(par_prop) && global.tutorialIndex <= Tutorial.Ciao) {
	var distance =  par_prop.x - obj_player.x;
	if (distance < distanceMax) {
		if (!global.isStop && !_isStop) {
			switch (global.tutorialIndex) {
				case Tutorial.BlockLow:
					global.isInputsEnabled[Input.Jump] = true;
					break;
				case Tutorial.BlockHigh:
					global.isInputsEnabled[Input.Jump] = true;
					break;
				case Tutorial.Enemy:
					global.isInputsEnabled[Input.Jump] = true;
					global.isInputsEnabled[Input.Beam] = true;
					break;
			}
			global.isStop = true;
			_isStop = true;
		}
	}
} else if (_isStop) {
	if (global.tutorialIndex < Tutorial.Enemy) {
		global.isInputsEnabled = [false, false, false];
	}
	global.isStop = false;
	_isStop = false;
	alarm[++global.tutorialIndex] = GAME_FPS * 6;
	instance_destroy(obj_textBubble);
}

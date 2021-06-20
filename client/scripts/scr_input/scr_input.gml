function scr_input() {
	global.isInputs = [false, false, false];
	var inputs = [obj_jumpButton, obj_beamButton, obj_pauseButton];
	
	var fingerMax = 4;
	for (var i = 0; i < array_length(inputs); i++) {
		var button = inputs[i];
		if (global.platform == Platform.PC) {
			if (global.isInputsEnabled[i]) {
				switch (button) {
					case obj_jumpButton:
						global.isInputs[Input.Jump] = keyboard_check_pressed(vk_up);
						break;
					case obj_beamButton:
						global.isInputs[Input.Beam] = keyboard_check(vk_down);
						break;
					case obj_pauseButton:
						global.isInputs[Input.Pause] = keyboard_check_pressed(vk_escape);
						break;
				}
			}
		} else if (global.platform == Platform.Mobile) {
			for (var j = 0; j < fingerMax; j++) {
				if (device_mouse_check_button(j, mb_left)) {
					if (device_mouse_x(j) >= button.bbox_left && device_mouse_x(j) <= button.bbox_right &&
						device_mouse_y(j) >= button.bbox_top && device_mouse_y(j) <= button.bbox_bottom) {
						if (global.isInputsEnabled[i]) {
							switch (button) {
								case obj_jumpButton:
									if (!button.isPressed) {
										global.isInputs[Input.Jump] = true;
									}
									break;
								case obj_beamButton:
									global.isInputs[Input.Beam] = true;
									break;
								case obj_pauseButton:
									if (!button.isPressed) {
										global.isInputs[Input.Pause] = true;
									}
									break;
							}
						}
						button.isBoundary = true;
						button.isPressed = true;
					} else {
						button.isBoundary = false;
					}
				}
				
				if (device_mouse_check_button_released(j, mb_left)) {
					button.isBoundary = false;
					button.isPressed = false;
				}
			}
		}
	}
}

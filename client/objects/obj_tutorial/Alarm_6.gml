/// @description 튜토리얼 종료

global.gameState = GameState.InGame;

global.saveMap[? "tutorialDone"] = true;
scr_save(SAVE_FILE);

instance_destroy();
			
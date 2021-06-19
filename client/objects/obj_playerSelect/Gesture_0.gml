if (global.gameState == GameState.PlayerSelect) {
	global.gameState = GameState.InGame;
	scr_setPlayer(kind);
}

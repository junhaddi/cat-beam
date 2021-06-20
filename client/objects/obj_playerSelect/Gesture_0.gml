if (global.gameState == GameState.PlayerSelect && isCanTap) {
	global.gameState = GameState.InGame;
	scr_setPlayer(kind);
}

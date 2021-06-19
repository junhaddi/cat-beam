if (global.gameState == GameState.Tutorial || global.gameState == GameState.InGame) {
	visible = true;
	image_alpha = scr_ease(image_alpha, isBoundary ? 0.4 : 1);
} else {
	visible = false;
}

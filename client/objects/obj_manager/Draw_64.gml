switch (global.gameState) {
	case GameState.MainMenu:
		#region MainMenu
		draw_set_halign(fa_center);
		draw_sprite(spr_logo, -1, GAME_CENTER, 300);
		draw_text(GAME_CENTER, GAME_HEIGHT - 300, "아무키나 눌러서 지구정복");
		draw_set_halign(fa_left);
		#endregion
		break;
	case GameState.PlayerSelect:
		#region PlayerSelect
		#endregion
		break;
	case GameState.Tutorial:
		#region Tutorial
		#endregion
		break;
	case GameState.InGame:
		#region InGame
		// 점수
		var scoreText = "점수: " + string(global.gameScore);
		draw_set_color(c_black);
		draw_text(40, 40, scoreText);
		draw_set_color(c_white);

		// 실뭉치
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(30, 106, 200, 180, false);
		draw_set_alpha(1);
		draw_set_color(c_white);

		draw_sprite_ext(spr_stringBall, 0, 40, 180, 0.15, 0.15, 0, c_white, 1);
		draw_text(130, 125, global.stringBallCount);

		// 고등어
		for (var i = 0; i < global.mackerelCount; i++) {
			draw_sprite_ext(spr_mackerel, 0, 180 + i * 30, 140, 0.1, 0.1, 315, c_white, 1);
		}

		// 체력바
		var hpbarX = GAME_WIDTH / 2 - hpbarSpriteWidth / 2;
		var hpbarY = 30;

		draw_sprite(spr_hpbar, 0, hpbarX, hpbarY);
		draw_sprite_part(spr_hpbar, 1, 0, 0, hpbarWidth, hpbarSpriteHeight, hpbarX, hpbarY);
		#endregion
		break;
	case GameState.GameOver:
		#region GameOver
		draw_set_color(c_black)
		draw_set_alpha(0.5);
		draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false);
		draw_set_alpha(1);
		draw_set_color(c_white);
	
		draw_set_halign(fa_center);
		var gameOverText = "최종점수: " + string(global.gameScore);
		draw_text(GAME_CENTER, GAME_MIDDLE, gameOverText);
		draw_set_halign(fa_left);
		#endregion
		break;
}

switch (global.gameState) {
	case GameState.MainMenu:
		#region MainMenu
		draw_set_halign(fa_center);
		draw_sprite(spr_logo, 0, GAME_CENTER, 300);
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
		var scoreTextX = GAME_CENTER;
		var scoreTextY = 100;
		var scoreText = string(global.gameScore);
		draw_set_color(c_black);
		draw_set_halign(fa_center);
		draw_text(scoreTextX + 1, scoreTextY, scoreText);
		draw_text(scoreTextX - 1, scoreTextY, scoreText);
		draw_text(scoreTextX, scoreTextY + 1, scoreText);
		draw_text(scoreTextX, scoreTextY - 1, scoreText);
		draw_set_color(c_white);
		draw_text(scoreTextX, scoreTextY, scoreText);
		draw_set_halign(fa_left);

		// 고등어
		for (var i = 0; i < global.mackerelCount; i++) {
			draw_sprite_ext(spr_mackerel, 0, 30 + i * 40, 50, 0.4, 0.4, 315, c_white, 1);
		}

		// 체력바
		var hpbarX = GAME_WIDTH / 2;
		var hpbarY = 60;
		draw_sprite(spr_hpbar, 0, hpbarX, hpbarY);
		draw_sprite_part(spr_hpbar, 1, 0, 0, hpbarWidth, hpbarSpriteHeight, hpbarX - hpbarSpriteWidth / 2, hpbarY - hpbarSpriteHeight / 2);
		
		// 체력바 핀
		draw_sprite(spr_hpbarPin, 0, hpbarX - hpbarSpriteWidth / 2 + hpbarWidth, hpbarY);

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

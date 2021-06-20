if (isItems) {
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(GAME_CENTER - 460, GAME_MIDDLE - 200, GAME_CENTER + 460, GAME_MIDDLE + 200, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text(GAME_CENTER - 280, GAME_MIDDLE - 100, "츄르");
	draw_sprite(spr_ciao, 0, GAME_CENTER - 280, GAME_MIDDLE);
	draw_text_transformed(GAME_CENTER - 280, GAME_MIDDLE + 100, "체력을 회복 시켜준다", 0.6, 0.6, 0);
	
	draw_text(GAME_CENTER, GAME_MIDDLE - 100, "실뭉치");
	draw_sprite(spr_stringBall, 0, GAME_CENTER, GAME_MIDDLE);
	draw_text_transformed(GAME_CENTER, GAME_MIDDLE + 100, "방어력을 높여준다", 0.6, 0.6, 0);
	
	draw_text(GAME_CENTER + 280, GAME_MIDDLE - 100, "생선");
	draw_sprite(spr_mackerel, 0, GAME_CENTER + 280, GAME_MIDDLE);
	draw_text_transformed(GAME_CENTER + 280, GAME_MIDDLE + 100, "5개를 모으 시 피버타임 발동!\n(날생성은 1개, 구운 생선은 3개)", 0.6, 0.6, 0);
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

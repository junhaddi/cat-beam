draw_sprite(spr_hpbar, 0, 40, 40);

for (var i = 0; i < global.hp; i++) {
	draw_sprite(spr_hp, 0, GAME_WIDTH - 100 - 80 * i, 40);
}
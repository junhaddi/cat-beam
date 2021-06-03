// 점수
var scoreText = "점수: ";
scoreText = string_insert(global.gameScore, scoreText, string_length(scoreText) + 1);
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

// 체력
var hpbarSpriteWidth = sprite_get_width(spr_hpbar);
var hpbarSpriteHeight = sprite_get_height(spr_hpbar);
var hpbarX = GAME_WIDTH / 2 - hpbarSpriteWidth / 2;
var hpbarY = 30;

draw_sprite(spr_hpbar, 0, hpbarX, hpbarY);
draw_sprite_part(spr_hpbar, 1, 0, 0, hpbarWidth, hpbarSpriteHeight, hpbarX, hpbarY);

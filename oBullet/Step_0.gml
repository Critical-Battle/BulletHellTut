if (homing != 0 and homing < 99) {
	homing++;
}

if (homing == 99) {
	homing++;
	direction = point_direction( x, y, oPlayer.x, oPlayer.y);
	speed = 8;
}

if (homing != 0) {
	image_blend = merge_color(c_white, c_red, homing/100);
}
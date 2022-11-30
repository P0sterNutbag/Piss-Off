if fade {
	image_alpha -= 0.01;
	if image_alpha <= 0 {
		fade = false;
		image_alpha = 1;
		visible = false;
	}
}

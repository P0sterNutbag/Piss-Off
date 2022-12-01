audio_stop_all();
audio_play_sound(snd_intro,1,true);

enum states {
	walk,
	roll,
	cutscene,
	dead,
	stun,
	block,
	jump,
	knockback,
	die,
	duck,
	ladder,
	drop,
	toss,
	hold,
	wait,
	fakedie
}

// CAMERA //
var base_w = 384//416//384//416//208//1024;
var base_h = 216//234//216//234//117//768;
var max_w = display_get_width();
var max_h = display_get_height();
var aspect = display_get_width() / display_get_height();
if (max_w < max_h) {
    // portait
    var VIEW_WIDTH = min(base_w, max_w);
    var VIEW_HEIGHT = VIEW_WIDTH / aspect;
} else {
    // landscape
    var VIEW_HEIGHT = min(base_h, max_h);
    var VIEW_WIDTH = VIEW_HEIGHT * aspect;
}
camera_set_view_size(view_camera[0], floor(VIEW_WIDTH), floor(VIEW_HEIGHT))
view_wport[0] = max_w;
view_hport[0] = max_h;
surface_resize(application_surface, view_wport[0], view_hport[0]);
window_set_fullscreen(true);

// SET ALL OTHER ROOMS //
var _check = true;
var _rm = room_next(room);
var  _rprev = _rm;

while (_check = true) {
    var _cam = room_get_camera(_rm, 0);
    camera_destroy(_cam);
    var _newcam = camera_create_view((base_w - VIEW_WIDTH) div 2, (base_h - VIEW_HEIGHT) div 2, VIEW_WIDTH, VIEW_HEIGHT);
    room_set_camera(_rm, 0, _newcam);
    room_set_viewport(_rm, 0, true, 0, 0, VIEW_WIDTH, VIEW_HEIGHT);
    room_set_view_enabled(_rm, true);
    if _rm = room_last
        {
        _check = false;
        }
    else
        {
        _rprev = _rm;
        _rm = room_next(_rprev);
        }
}

display_set_gui_size(VIEW_WIDTH,VIEW_HEIGHT);
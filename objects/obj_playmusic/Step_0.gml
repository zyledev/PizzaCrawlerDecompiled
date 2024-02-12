if (!set)
{
	set = 1;
	music = scr_asset_get_index(music, 2);
	loop = loop == "true" || loop == "1";
	try
	{
		volume = real(volume);
	}
	catch (error)
	{
		volume = 1;
	}
	try
	{
		offset = real(offset);
	}
	catch (error)
	{
		offset = 0;
	}
	try
	{
		pitch = real(pitch);
	}
	catch (error)
	{
		pitch = 1;
	}
}
var _id = id;
collideplayer = place_meeting(x, y, obj_player);
var wbjh = 0;
with (obj_playmusic)
{
	if (place_meeting(x, y, obj_player))
	{
		if (mutebg && id != _id)
			wbjh = 1;
	}
}
musicshouldmute = wbjh;
if (!collideplayer && player)
{
	audio_stop_sound(player);
	player = undefined;
}
if (!musicshouldmute && (!collideplayer || !mutebg) && global.mute)
{
	global.mute = 0;
	global.shopoverride = 0;
	if (global.useshoptheme)
		audio_resume_sound(mus_shop);
	else
	{
		with (obj_editor)
		{
			if (player)
				audio_resume_sound(player);
			else
				audio_resume_all();
		}
	}
}
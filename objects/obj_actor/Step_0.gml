if !set
{
	set = true;
	normalspr = scr_asset_get_index(normalspr, 1);
	panicspr = scr_asset_get_index(panicspr, 1);
	var sprtouse = panicspr == undefined ? spr_actor : panicspr;
	if normalspr == undefined
		normalspr = sprtouse;
	if panicspr == undefined
		panicspr = normalspr;
	try
	{
		image_speed = real(imgspeed);
	}
	catch (error)
	{
		exit;
	}
}
if global.panic
	sprite_index = panicspr;
else
	sprite_index = normalspr;
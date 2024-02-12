if !instance_exists(obj_levelselect) && !disable
{
	disable = true;
	global.ugggghhhh = [levelname, target_room, target_door];
	try
	{
		global.custompoints = min(9999, real(point));
	}
	catch (error)
		exit;
	try
	{
		global.customkilledbaddies = min(99, real(baddie));
	}
	catch (error)
		exit;
	with instance_create(x, y, obj_levelselect)
	{
		editorlevel = other.levelname;
		editorroom = other.target_room;
		editordoor = other.target_door;
	}
}
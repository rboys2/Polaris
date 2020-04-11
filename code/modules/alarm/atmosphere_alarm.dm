/datum/alarm_handler/atmosphere
	category = "Atmosphere Alarms"

/datum/alarm_handler/atmosphere/major_alarms(var/z)
	var/list/major_alarms = new()
	var/list/map_levels = using_map.get_map_levels(z)
	for(var/datum/alarm/A in visible_alarms())
		if(z && (z && !(A.origin?.z in map_levels)))
			continue
		if(A.max_severity() > 1)
			major_alarms.Add(A)
	return major_alarms

/datum/alarm_handler/atmosphere/minor_alarms(var/z)
	var/list/minor_alarms = new()
	var/list/map_levels = using_map.get_map_levels(z)
	for(var/datum/alarm/A in visible_alarms())
		if(z && (z && !(A.origin?.z in map_levels)))
			continue
		if(A.max_severity() == 1)
			minor_alarms.Add(A)
	return minor_alarms

--[[pod_format="raw",created="2025-06-19 10:38:05",modified="2025-06-20 06:09:44",revision=86]]

argv = env().argv

-- default settings
-- (currently only used as a list of keys)
settings = 
{
	battery_saver=false,
	blit_720p=false,
	snap_to_grid=false,
	floppy_windows=false,
	fullscreen=true,
	mute_audio=false,
	network_access=true,
	pixel_perfect=true,
	rshift_magnify=false,
	sparkles=false,
	squishy_windows=false,
	stretch=false,
	swap_stereo=false,
--	system_volume=64, -- to do
	theme="/system/themes/aqua.theme",
	wallpaper="/system/wallpapers/patchwork.p64"
}

keys = {}
for k,v in pairs(settings) do
	add(keys,k)
end
for j=1,#keys-1 do
for i=1,#keys-1 do
	if (keys[i] > keys[i+1]) keys[i],keys[i+1]=keys[i+1],keys[i]
end
end


sdat = fetch("/appdata/system/settings.pod")

if (not argv[1]) then
	
	for i=1,#keys do
		local k,v = keys[i], sdat[keys[i]]
		print(string.format("\^h%s\^g\-z\-z\-z\-z\-z  \fe%s",k..":",tostr(v)),6)
	end
	print("To change a value, use: \f7config [key] [value]",13)
	exit(0)
end

-- find current
k = argv[1]

if (not argv[2]) then
	print(k..": \fe"..tostring(sdat[k]))
	exit(0)
end

-- set value
if (settings[k] ~= nil) then
	v = argv[2]
	if (v == "nil") v = nil
	if (v == "true") v = true
	if (v == "false") v = false
	if (v == "on") v = true
	if (v == "off") v = false
	
	sdat[k] = v
	store("/appdata/system/settings.pod",sdat)
	print("set "..k.." to \fe"..tostring(sdat[k]))
	exit(0)
end

print("key not found: "..k)
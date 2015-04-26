local sklls = {"pro","std","poor"}

addEventHandler("onResourceStart", resourceRoot, function()
	for _, skll in ipairs(sklls) do
		setWeaponProperty(22, skll, "weapon_range", 1000)
		setWeaponProperty(23, skll, "weapon_range", 1000)
		setWeaponProperty(24, skll, "weapon_range", 1000)
		setWeaponProperty(25, skll, "weapon_range", 1000)
		setWeaponProperty(26, skll, "weapon_range", 1000)
		setWeaponProperty(27, skll, "weapon_range", 1000)
		setWeaponProperty(28, skll, "weapon_range", 1000)
		setWeaponProperty(29, skll, "weapon_range", 1000)
		setWeaponProperty(30, skll, "weapon_range", 1000)
		setWeaponProperty(31, skll, "weapon_range", 1000)
		setWeaponProperty(32, skll, "weapon_range", 1000)
		setWeaponProperty(33, skll, "weapon_range", 1000)
		setWeaponProperty(34, skll, "weapon_range", 1000)
		
		setWeaponProperty(27, skll, "maximum_clip_ammo", 2)
	end
end)
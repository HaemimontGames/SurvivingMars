FadeCategories = {
	Auto = 
	{
		min = 0,
		max = 0,
	},
	Never = 
	{
		min = -1,
		max = -1,
	},
	Grass =
	{
		min = 200,
		max = 300,
	},
}

if not FirstLoad then
	CreateRealTimeThread( function()
		ReloadFadeCategories()
	end )
end
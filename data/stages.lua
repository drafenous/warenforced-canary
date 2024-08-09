-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 100,
		multiplier = 100,
	},
	{
		minlevel = 101,
		multiplier = 50,
	},
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 30,
	},
	{
		minlevel = 61,
		multiplier = 15,
	},
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 30,
	},
	{
		minlevel = 61,
		multiplier = 15,
	},
}

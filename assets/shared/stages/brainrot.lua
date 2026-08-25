function onCreate()
	-- Background
	makeLuaSprite('Gayground', 'bgs/bg1', -563, -286)
	setScrollFactor('Gayground', 1, 1)
	scaleObject('Gayground', 1.35, 1.35)
	setProperty('Gayground.antialiasing', false)
	setProperty('Gayground.alpha', 1)
	addLuaSprite('Gayground', false)

	close(true)
end

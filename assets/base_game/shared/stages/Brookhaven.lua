local ease = 'quadOut'
local tmpPC = 6
local veloDaRoda = 1200

function onCreatePost()
setProperty('gf.visible', false)
makeLuaSprite('bg', 'Brookhaven/BG', -526, -475)
addLuaSprite('bg', false)

makeLuaSprite('sombraDad', 'sombraPersonagem', 300, 1050)
scaleObject('sombraDad', 0.7, 0.7)
addLuaSprite('sombraDad', false)
setProperty('sombraDad.alpha', 0.4)

makeLuaSprite('sombraBF', 'sombraPersonagem', 1870, 1000)
scaleObject('sombraBF', 0.6, 0.7)
addLuaSprite('sombraBF', false)
setProperty('sombraBF.alpha', 0.4)

makeLuaSprite('sombraCAMIN', 'Brookhaven/sombraCaminhao', 2812, -120)
scaleObject('sombraCAMIN', 1.45, 1.45)
addLuaSprite('sombraCAMIN', false)

makeLuaSprite('roda1', 'Brookhaven/Roda', 2940, 482)
scaleObject('roda1', 1.45, 1.45)
addLuaSprite('roda1', false)
setProperty('roda1.angle', veloDaRoda)

makeLuaSprite('roda2', 'Brookhaven/Roda', 3790, 482)
scaleObject('roda2', 1.45, 1.45)
addLuaSprite('roda2', false)
setProperty('roda2.angle', veloDaRoda)

makeLuaSprite('roda3', 'Brookhaven/Roda', 4005, 482)
scaleObject('roda3', 1.45, 1.45)
addLuaSprite('roda3', false)
setProperty('roda3.angle', veloDaRoda)

makeLuaSprite('roda4', 'Brookhaven/Roda', 4950, 482)
scaleObject('roda4', 1.45, 1.45)
addLuaSprite('roda4', false)
setProperty('roda4.angle', veloDaRoda)

makeLuaSprite('roda5', 'Brookhaven/Roda', 5165, 482)
scaleObject('roda5', 1.45, 1.45)
addLuaSprite('roda5', false)
setProperty('roda5.angle', veloDaRoda)

makeAnimatedLuaSprite('camin', 'Brookhaven/Caminhao', 2812, -120)
scaleObject('camin', 1.45, 1.45)
addAnimationByPrefix('camin', 'Anda', 'andando', 16, true)
addAnimationByPrefix('camin', 'Idle', 'idle', 16, true)
addLuaSprite('camin', false)

makeAnimatedLuaSprite('Kids', 'Brookhaven/Roblox Chars', 320, -250)
scaleObject('Kids', 0.9, 0.9)
addAnimationByPrefix('Kids', 'Idle', 'idle', 16, false)
addLuaSprite('Kids', false)

makeLuaSprite('Placas', 'Brookhaven/Placas', -526, 900)
scaleObject('Placas', 1.25, 1.25)
setScrollFactor('Placas', 1.3, 1.3)
addLuaSprite('Placas', true)

makeLuaSprite('void','Vs Rennan/voideprincipal', 0, 0)
setObjectCamera('void', 'camOther')
addLuaSprite('void', true)
setProperty('void.alpha', 0.5)
ritmo1 = true
end

function onBeatHit()
	if curBeat % 2 == 0 and ritmo1 == true then
	playAnim('Kids', 'Idle', false)
	
	elseif curBeat % 2 == 1 and ritmo1 == false then
	playAnim('Kids', 'Idle', false)
	end
end

function onStepHit()
	if curStep == 352 then
	doTweenX('caminhao', 'camin', -188, tmpPC, ease)
	doTweenX('caminhaoSombra', 'sombraCAMIN', -188, tmpPC, ease)
	doTweenX('roda1', 'roda1', -60, tmpPC, ease)
	doTweenX('roda2', 'roda2', 790, tmpPC, ease)
	doTweenX('roda3', 'roda3', 1005, tmpPC, ease)
	doTweenX('roda4', 'roda4', 1950, tmpPC, ease)
	doTweenX('roda5', 'roda5', 2165, tmpPC, ease)
	doTweenColor('dadC', 'dad', 'CCCCCC', tmpPC)
	doTweenColor('bfC', 'boyfriend', 'CCCCCC', tmpPC)
	doTweenColor('kidsC', 'Kids', 'CCCCCC', tmpPC)
	--angulos agora :)
	
	doTweenAngle('rodaAng1', 'roda1', 0, tmpPC, ease)
	doTweenAngle('rodaAng2', 'roda2', 0, tmpPC, ease)
	doTweenAngle('rodaAng3', 'roda3', 0, tmpPC, ease)
	doTweenAngle('rodaAng4', 'roda4', 0, tmpPC, ease)
	doTweenAngle('rodaAng5', 'roda5', 0, tmpPC, ease)
	
	elseif curStep == 639 then
	ritmo1 = false
	end
end

function onTweenCompleted(tag)
	if tag == 'caminhao' then
	playAnim('camin', 'Idle', false)
	end
end
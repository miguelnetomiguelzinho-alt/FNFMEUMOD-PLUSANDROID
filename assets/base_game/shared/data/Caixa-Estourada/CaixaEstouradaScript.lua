local treme = 0.015

function onCreatePost()
makeLuaSprite('black','',0,0)
setObjectCamera('black','hud')
makeGraphic('black',screenWidth,screenHeight,'000000')
addLuaSprite('black',false)

makeLuaSprite('black2','',0,0)
setObjectCamera('black2','other')
makeGraphic('black2',screenWidth,screenHeight,'646464')
setBlendMode('black2','SUBTRACT')
addLuaSprite('black2',false)
setProperty('black2.alpha', 0.5)
setProperty('black2.visible', false)

setProperty('boyfriend.x', 750)
setProperty('gf.x', getProperty('boyfriend.x') - 350)

makeLuaSprite('bfCabado', 'bfCoisas/cabado', 0, 0)
setProperty('bfCabado.x', getProperty('boyfriend.x') + 40)
setProperty('bfCabado.y', getProperty('boyfriend.y'))
setProperty('bfCabado.scale.x', getProperty('boyfriend.scale.x'))
setProperty('bfCabado.scale.y', getProperty('boyfriend.scale.y'))
addLuaSprite('bfCabado', true)

makeLuaSprite('gfCabada', 'bfCoisas/gf/cabada', 0, 0)
setProperty('gfCabada.x', getProperty('gf.x'))
setProperty('gfCabada.y', getProperty('gf.y'))
setProperty('gfCabada.scale.x', getProperty('gf.scale.x'))
setProperty('gfCabada.scale.y', getProperty('gf.scale.y'))
addLuaSprite('gfCabada', true)

beatCam = false
tremedeira = false

makeAnimatedLuaSprite('boom', 'bfCoisas/Explosao Animada', 0, 0)
setProperty('boom.x', getProperty('boyfriend.x'))
setProperty('boom.y', getProperty('boyfriend.y') + 50)
scaleObject('boom', 2, 2)
addAnimationByPrefix('boom', 'BOOM', 'boom', 10, false)
addLuaSprite('boom', true)
setProperty('boom.visible', false)

setProperty('gfCabada.visible', false)
setProperty('bfCabado.visible', false)

noteTweenX('badleftmoveright', 0, 4000, 0.01);
noteTweenX('badupmoveright', 1, 4000, 0.01);
noteTweenX('baddownmoveright', 2, 4000, 0.01);
noteTweenX('badrightmoveright', 3, 4000, 0.01);
end

function onStepHit()
if curStep == 0 then

elseif curStep == 4 then
setProperty('black.alpha', 0.75)

elseif curStep == 8 then
setProperty('black.alpha', 0.5)

elseif curStep == 12 then
setProperty('black.alpha', 0.25)

elseif curStep == 16 then
setProperty('black.alpha', 0)

elseif curStep == 174 then
beatCam = true

elseif curStep == 176 then
setProperty('black2.visible', true)
setProperty('gf.visible', false)
setProperty('boyfriend.visible', false)
setProperty('gfCabada.visible', true)
setProperty('bfCabado.visible', true)
tremedeira = true

elseif curStep == 190 or curStep == 206 or curStep == 222  or curStep == 238 or curStep == 254 or curStep == 270 or curStep == 286 or curStep == 302 then
doTweenZoom('zoombeat', 'camHUD', 1.3, 0.001)
doTweenZoom('zoombeat1', 'camHUD', 1, 1.5, 'expoOut')
doTweenZoom('zoombeatgame', 'camGame', 1.9, 0.001)
doTweenZoom('zoombeatgame1', 'camGame', 1.5, 1.5, 'expoOut')
triggerEvent('Play Animation', 'toma', 'dad')

elseif curStep == 301 then
beatCam = false

elseif curStep == 315 then
beatCam = false

elseif curStep == 304 then
doTweenAlpha('black2', 'black2', 0, 1, 'expoOut')
doTweenZoom('zoombeat1', 'camHUD', 1, 0.01)
doTweenZoom('zoombeatgame1', 'camGame', 1.5, 0.01)

elseif curStep == 342 then
setProperty('boom.visible', true)
objectPlayAnimation('boom', 'BOOM', false)
end
end

function onUpdatePost()
if mustHitSection == false and tremedeira == true then
cameraShake('camGame', treme, treme)
cameraShake('camHud', treme, treme);
end
end

function onBeatHit()
if beatCam == true then
doTweenZoom('zoombeat', 'camHUD', 1.3, 0.001)
doTweenZoom('zoombeat1', 'camHUD', 1, 1.5, 'expoOut')
doTweenZoom('zoombeatgame', 'camGame', 1.9, 0.001)
doTweenZoom('zoombeatgame1', 'camGame', 1.5, 1.5, 'expoOut')
triggerEvent('Play Animation', 'toma', 'dad')
end
end
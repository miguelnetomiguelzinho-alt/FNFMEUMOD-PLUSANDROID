function onCreatePost()
setProperty('gf.visible', false)

makeLuaSprite('void','Vs Rennan/voideprincipal',0,0)
setObjectCamera('void', 'camOther')
addLuaSprite('void', true)
setProperty('void.alpha', 0.5)

makeLuaSprite('black', '', 0, 0)
makeGraphic('black', 1280, 720, '000000')
setObjectCamera('black', 'other')
addLuaSprite('black', false)

setProperty('camHUD.visible', false)
end

function onStepHit()
if curStep == 16 then
doTweenAlpha('preto', 'black', 0, 6)

elseif curStep == 128 then
setProperty('black.alpha', 1)
setProperty('camHUD.visible', true)

elseif curStep == 143 then
cameraFlash('hud', 'ffffff', 1)
setProperty('cameraSpeed', 1.4)
setProperty('black.visible', false)
setObjectCamera('black', 'hud')

elseif curStep == 271 then
cameraFlash('hud', 'ffffff', 1)
setProperty('cameraSpeed', 1.8)
triggerEvent('Change Scroll Speed', 1.2, 0.01)

elseif curStep == 393 then
setProperty('black.visible', true)

elseif curStep == 399 then
setProperty('black.visible', false)
cameraFlash('hud', 'ffffff', 1)

elseif curStep == 527 then
setProperty('black.visible', true)
end
end
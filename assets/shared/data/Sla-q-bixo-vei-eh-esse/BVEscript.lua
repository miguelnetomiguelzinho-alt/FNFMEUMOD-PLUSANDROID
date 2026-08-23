function onCreatePost()
setObjectOrder('Caixa', getObjectOrder('whitebg') + 1)
setObjectOrder('gf', getObjectOrder('Caixa') + 1)
setProperty('gf.visible', true)

makeLuaSprite('black', '', 0, 0)
makeGraphic('black', 1280, 720, '000000')
setObjectCamera('black', 'other')
addLuaSprite('black', false)
end

function onStepHit()
if curStep == 16 then
doTweenAlpha('preto', 'black', 0, 5)

elseif curStep == 64 or curStep == 832 then
cameraFlash('hud', 'ffffff', 1)

elseif curStep == 318 then
ang = 0

elseif curStep == 568 then
doTweenAngle('hud', 'camHUD', 0, 1, 'quadOut')
ang = 3
end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
if curStep > 319 and curStep < 329 then
cameraShake('camGame', 0.3, 0.015)
cameraShake('camHud', 0.3, 0.015)
end
end

function onBeatHit()
if ang == 1 then
doTweenAngle('hud', 'camHUD', -1.5, 0.1, 'elasticOut')
ang = 0

elseif ang == 0 then
doTweenAngle('hud', 'camHUD', 1.5, 0.1, 'elasticOut')
ang = 1
end
end
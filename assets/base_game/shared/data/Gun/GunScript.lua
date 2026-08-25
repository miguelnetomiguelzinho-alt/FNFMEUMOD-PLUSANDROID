local treme = 0.025
local tmpArma = 2
local easeArma = 'sineInOut'

function onCreatePost()
addCharacterToList('3ampico-azul', 'bf')
doTweenY('Arma', 'dad', getProperty('dad.y') + 100, tmpArma, easeArma)

makeLuaSprite('black', '', 0, 0)
makeGraphic('black', 1280, 720, '000000')
setObjectCamera('black', 'other')
addLuaSprite('black', false)

makeLuaSprite('barra', 'barras', 0, 0)
setObjectCamera('barra', 'hud')
addLuaSprite('barra', false)
setProperty('barra.scale.y', 1.4)
end

function onSongStart()
doTweenAlpha('preto', 'black', 0, 7)
doTweenY('bar', 'barra.scale', 1, 7, 'quadOut')
end

function onStepHit()
if curStep == 1052 then
setProperty('vocals.volume', 0)

elseif curStep == 640 or curStep == 896 then
doTweenColor('aura', 'aura', '00ffff', 1)
doTweenColor('dad', 'dad', '00ffff', 1)

elseif curStep == 644 or curStep == 900 then
triggerEvent('Change Character', 'BF', '3ampico-azul')

elseif curStep == 772 or curStep == 959 then
triggerEvent('Change Character', 'BF', '3ampico')

elseif curStep == 768 or curStep == 960 then
doTweenColor('aura2', 'aura', 'ff0000', 1)
doTweenColor('dad2', 'dad', 'ffffff', 1)
end
end

function onUpdatePost()
doTweenAlpha('auraAlpha', 'aura', 0.2, 0.01)
end

function onTweenCompleted(tag)
if tag == 'Arma' then
doTweenY('Arma2', 'dad', getProperty('dad.y') - 200, tmpArma, easeArma)

elseif tag == 'Arma2' then
doTweenY('Arma', 'dad', getProperty('dad.y') + 200, tmpArma, easeArma)
end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
if mustHitSection == false then
        health = getProperty('health')

        if getProperty('health') > 0.2 then
            setProperty('health', health- 0.035);
        end
    end
cameraShake('camGame', treme, treme)
cameraShake('camHud', 0.01, 0.01)

if curStep > 667 and curStep < 672 then
cameraShake('camGame', 0.3, treme)
cameraShake('camHud', 0.3, treme)
end
end
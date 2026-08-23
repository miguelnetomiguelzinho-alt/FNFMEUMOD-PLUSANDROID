local ease = 'sineInOut'

function onCreatePost()
setProperty('gf.visible', false)

makeLuaSprite('efeitoMagonha', 'picoCoisas/efeito', 0, 0)
setObjectCamera('efeitoMagonha', 'hud')
addLuaSprite('efeitoMagonha', true)
setProperty('efeitoMagonha.alpha', 0.8)

makeLuaSprite('green', '', 0, 0)
makeGraphic('green', 1280, 720, '3CA33E')
setObjectCamera('green', 'hud')
addLuaSprite('green', true)

makeLuaSprite('black', '', 0, 0)
makeGraphic('black', 1280, 720, '000000')
setObjectCamera('black', 'hud')
addLuaSprite('black', true)
end

function onSongStart()
doTweenAlpha('preto', 'black', 0, 6, ease)
doTweenAlpha('verde', 'green', 0, 5, ease)

triggerEvent('Play Animation', 'pisca', 'BF')
runTimer('piscar', 3)
runTimer('piscarPico', 2)
podePiscarBF = true
podePiscarPico = true
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
podePiscarBF = false
runTimer('podePiscar', 2)
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
podePiscarPico = false
runTimer('podePiscarPico', 2)
end
 
function onTimerCompleted(tag)
if tag == 'piscar' and podePiscarBF == true then
triggerEvent('Play Animation', 'pisca', 'BF')
runTimer('piscar2', 2)

elseif tag == 'piscar2' and podePiscarBF == true then
triggerEvent('Play Animation', 'pisca', 'BF')
runTimer('piscar', 3)

elseif tag == 'podePiscar' then
triggerEvent('Play Animation', 'pisca', 'BF')
runTimer('piscar', 3)
podePiscarBF = true

elseif tag == 'piscarPico' and podePiscarPico == true then
runTimer('piscarPico2', 4)
triggerEvent('Play Animation', 'pisca', 'dad')

elseif tag == 'piscarPico2' and podePiscarPico == true then
runTimer('piscarPico', 2)
triggerEvent('Play Animation', 'pisca', 'dad')

elseif tag == 'podePiscarPico' then
triggerEvent('Play Animation', 'pisca', 'dad')
runTimer('piscarPico', 2)
podePiscarPico = true
end
end
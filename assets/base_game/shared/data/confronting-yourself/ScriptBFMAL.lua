local tempo = 1

function onCreatePost()
setProperty('cameraSpeed', 1.4)
setProperty('gf.visible', false)

makeLuaSprite('barras', 'barras', 1280, 0)
setObjectCamera('barras', 'hud')
addLuaSprite('barras', false)

makeLuaSprite('barras1', 'barras', -1280, 0)
setObjectCamera('barras1', 'hud')
addLuaSprite('barras1', false)
end

function onTweenCompleted(tag)
if tag == 'barras1' then
removeLuaSprite('barras1', true)
end
end

function onSongStart()
doTweenX('barr', 'barras', 0, 1.2, 'expoInOut')
doTweenX('barr1', 'barras1', 0, 1.2, 'expoInOut')
noteTweenAlpha('oppo0', 0, 0, tempo, 'linear')
noteTweenAlpha('oppo1', 1, 0, tempo, 'linear')
noteTweenAlpha('oppo2', 2, 0, tempo, 'linear')
noteTweenAlpha('oppo3', 3, 0, tempo, 'linear')

noteTweenAlpha('oppo4', 4, 0, tempo, 'linear')
noteTweenAlpha('oppo5', 5, 0, tempo, 'linear')
noteTweenAlpha('oppo6', 6, 0, tempo, 'linear')
noteTweenAlpha('oppo7', 7, 0, tempo, 'linear')


end

function onStepHit()
if curStep == 56 then
noteTweenAlpha('oppo0', 0, 1, tempo, 'linear')
noteTweenAlpha('oppo1', 1, 1, tempo, 'linear')
noteTweenAlpha('oppo2', 2, 1, tempo, 'linear')
noteTweenAlpha('oppo3', 3, 1, tempo, 'linear')

noteTweenAlpha('oppo4', 4, 1, tempo, 'linear')
noteTweenAlpha('oppo5', 5, 1, tempo, 'linear')
noteTweenAlpha('oppo6', 6, 1, tempo, 'linear')
noteTweenAlpha('oppo7', 7, 1, tempo, 'linear')
end
end
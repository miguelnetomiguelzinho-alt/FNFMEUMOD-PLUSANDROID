local ease = 'expoInOut'

function onCreatePost()
doTweenZoom('camOther', 'camGame', 0.8, 0.001)

makeLuaSprite('barra', 'barra', 0, -83)
setObjectCamera('barra', 'hud')
addLuaSprite('barra', false)

makeLuaSprite('barra1', 'barra', 0, 721)
setObjectCamera('barra1', 'hud')
addLuaSprite('barra1', false)
end

function onSongStart()
doTweenY('Bar1', 'barra', -1, 1, ease)
doTweenY('Bar2', 'barra1', 639, 1, ease)
end

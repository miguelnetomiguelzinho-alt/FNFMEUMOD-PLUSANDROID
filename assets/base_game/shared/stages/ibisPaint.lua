function onCreatePost()
setProperty('gf.visible', false)
makeLuaSprite('bg', 'ibisPaint/ibisPrint', -470, 250)
scaleObject('bg', 1.9, 1.9)
addLuaSprite('bg', false)

makeLuaSprite('hudIP', 'ibisPaint/Hud', -370, 30)
scaleObject('hudIP', 1.9, 1.9)
setScrollFactor('hudIP', 1.1, 1.1)
addLuaSprite('hudIP', true)
end
function onCreatePost()
setProperty('gf.visible', false)

if not lowQuality then
makeLuaSprite('BG', 'quartoPico/BG', 0, -200)
scaleObject('BG', 1.1, 1.1)
addLuaSprite('BG', false)

makeLuaSprite('efeito', 'quartoPico/escuro', 0, -200)
scaleObject('efeito', 1.1, 1.1)
addLuaSprite('efeito', false)

makeLuaSprite('aura', 'quartoPico/aura', -500, -600)
scaleObject('aura', 4, 4)
addLuaSprite('aura', false)
doTweenColor('aura', 'aura', 'ff0000', 0.01)
doTweenAlpha('auraAlpha', 'aura', 0.2, 0.01)
end
end
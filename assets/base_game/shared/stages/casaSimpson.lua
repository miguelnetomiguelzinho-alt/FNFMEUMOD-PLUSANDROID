function onCreate()
makeLuaSprite('BG', 'casaSimpson/BG', -20, -110)
scaleObject('BG', 0.76, 0.76)
addLuaSprite('BG', false)
setProperty('BG.alpha', 1)

makeLuaSprite('atm', 'casaSimpson/atmosfera', -20, -110)
scaleObject('atm', 0.76, 0.76)
addLuaSprite('atm', true)

makeLuaSprite('void','Vs Rennan/voideprincipal',0,0)
setObjectCamera('void', 'camOther')
addLuaSprite('void', true)
end

function onCreatePost()
setProperty('gf.visible', false)
end
function onCreate()

makeAnimatedLuaSprite('nievla', 'weekend1-bf-mix/nievla', -1320, -944)
addAnimationByPrefix('nievla', 'anim', 'Symbol 350', 24, true)
scaleObject('nievla', 4, 4)
setBlendMode('nievla', 'add')

makeAnimatedLuaSprite('phillyCars1', 'weekend1-bf-mix/phillyCars', 3000, 0)
addAnimationByPrefix('phillyCars1', 'car1', 'car1', 24, false)
addAnimationByPrefix('phillyCars1', 'car2', 'car2', 24, false)
addAnimationByPrefix('phillyCars1', 'car3', 'car3', 24, false)
addAnimationByPrefix('phillyCars1', 'car4', 'car4', 24, false)
setProperty('phillyCars1.flipX', false)
scaleObject('phillyCars1', 1, 1)
setScrollFactor('phillyCars1', 1, 1)

makeAnimatedLuaSprite('phillyCars2', 'weekend1-bf-mix/phillyCars', 0, 0)
addAnimationByPrefix('phillyCars2', 'car1', 'car1', 24, false)
addAnimationByPrefix('phillyCars2', 'car2', 'car2', 24, false)
addAnimationByPrefix('phillyCars2', 'car3', 'car3', 24, false)
addAnimationByPrefix('phillyCars2', 'car4', 'car4', 24, false)
setProperty('phillyCars2.flipX', true)
scaleObject('phillyCars2', 1, 1)
setScrollFactor('phillyCars2', 1, 1)
setProperty('phillyCars2.alpha', 1)

makeLuaSprite('phillySkybox', 'weekend1-bf-mix/phillySkybox', -700, -200)
addLuaSprite('phillySkybox', false)
scaleObject('phillySkybox', 2, 2)
setScrollFactor('phillySkybox', 0.3, 0.3)

makeLuaSprite('phillySkyline', 'weekend1-bf-mix/phillySkyline', -700, -300)
addLuaSprite('phillySkyline', false)
scaleObject('phillySkyline', 2, 2)
setScrollFactor('phillySkyline', 0.3, 0.3)

makeLuaSprite('phillyForegroundCity', 'weekend1-bf-mix/phillyForegroundCity', 350, -20)
addLuaSprite('phillyForegroundCity', false)
scaleObject('phillyForegroundCity', 2, 2)
setScrollFactor('phillyForegroundCity', 0.4, 0.4)

makeLuaSprite('phillyConstruction', 'weekend1-bf-mix/phillyConstruction', 1000, -150)
addLuaSprite('phillyConstruction', false)
scaleObject('phillyConstruction', 2, 2)
setScrollFactor('phillyConstruction', 0.6, 0.6)

makeLuaSprite('phillySmog', 'weekend1-bf-mix/phillySmog', -1000, -200)
addLuaSprite('phillySmog', false)
scaleObject('phillySmog', 2, 2)
setScrollFactor('phillySmog', 0.8, 0.8)


makeAnimatedLuaSprite('phillyTraffic', 'weekend1-bf-mix/phillyTraffic', 900, 170)
addAnimationByPrefix('phillyTraffic', 'tored', 'greentored', 24, false)
addAnimationByPrefix('phillyTraffic', 'togreen', 'redtogreen', 24, false)
setProperty('phillyTraffic.flipX', false)
scaleObject('phillyTraffic', 2, 2)
setScrollFactor('phillyTraffic', 0.9, 1)
addLuaSprite('phillyTraffic', false)
runTimer('greentoredTimer', 11)

makeLuaSprite('phillyTraffic_lightmap', 'weekend1-bf-mix/phillyTraffic_lightmap', 900, 170)
scaleObject('phillyTraffic_lightmap', 2, 2)
setScrollFactor('phillyTraffic_lightmap', 0.9, 1)
setBlendMode('phillyTraffic_lightmap','add')
addLuaSprite('phillyTraffic_lightmap', false)

makeLuaSprite('phillyHighway', 'weekend1-bf-mix/phillyHighway', -1050, -250)
addLuaSprite('phillyHighway', false)
scaleObject('phillyHighway', 2, 2)
setScrollFactor('phillyHighway', 1, 1)
addLuaSprite('phillyCars1', false)
addLuaSprite('phillyCars2', false)

makeLuaSprite('phillyForeground', 'weekend1-bf-mix/phillyForeground', -1100, -100)
addLuaSprite('phillyForeground', false)
scaleObject('phillyForeground', 2, 2)
setScrollFactor('phillyForeground', 1, 1)

addLuaSprite('nievla', true)

setProperty('phillyCars1.x', 700)
setProperty('phillyCars1.y', 80)
setProperty('phillyCars1.angle', -20)
setProperty('phillyCars2.x', 700)
setProperty('phillyCars2.y', 80)
setProperty('phillyCars2.angle', 30)

runTimer('leftCarTween1', getRandomInt(25,55) *0.1, getRandomInt(1, 2))
runTimer('rightCarTween', getRandomInt(25,55) *0.1, getRandomInt(1, 2))

end

local Light = 0
local carWaiting = 0
local Car1variant = 0
local Car1speed = getRandomInt(10, 17) *0.1
local Car2variant = 0
local Car2speed = getRandomInt(10, 17) *0.1
function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'redtogreenTimer' then
Light = 0
playAnim('phillyTraffic', 'togreen', false)
runTimer('greentoredTimer', 11)
runTimer('leftCarTween1', getRandomInt(25,55) *0.1, getRandomInt(1, 2))
runTimer('rightCarTween', getRandomInt(25,55) *0.1, getRandomInt(1, 2))
if carWaiting == 1 then
carWaiting = 0
runTimer('leftCarTween11', 0.5)
end
end
if tag == 'leftCarTween11' then
doTweenAngle('phillyCars1TweenAngle', 'phillyCars1', 30, 1.7, 'sineIn')
end
if tag == 'greentoredTimer' then
Light = 1
playAnim('phillyTraffic', 'tored', false);
runTimer('redtogreenTimer', 8);
runTimer('leftCarTween2', getRandomInt(25,55) *0.1);
end
if tag == 'leftCarTween1' then
Car1variant = getRandomInt(1,4)
if Car1variant == 1 then
Car1speed = getRandomInt(10, 17) *0.1
elseif Car1variant == 2 then
Car1speed = getRandomInt(09, 15) *0.1
elseif Car1variant == 3 then
Car1speed = getRandomInt(15, 25) *0.1
elseif Car1variant == 4 then
Car1speed = getRandomInt(15, 25) *0.1
end
playAnim('phillyCars1', 'car'..Car1variant, false);
setProperty('phillyCars1.angle', -20);
doTweenAngle('phillyCars1TweenAngle', 'phillyCars1', 30, 1.7, 'linear');
end
if tag == 'leftCarTween2' then
carWaiting = 1
Car1variant = getRandomInt(1,4)
playAnim('phillyCars1', 'car'..Car1variant, false);
setProperty('phillyCars1.angle', -20);
doTweenAngle('phillyCars1TweenAngle', 'phillyCars1', -5, 1.7, 'sineOut');
end
if tag == 'rightCarTween' then
Car2variant = getRandomInt(1,4)
if Car2variant == 1 then
Car2speed = getRandomInt(10, 17) *0.1
elseif Car2variant == 2 then
Car2speed = getRandomInt(09, 15) *0.1
elseif Car2variant == 3 then
Car2speed = getRandomInt(15, 25) *0.1
elseif Car2variant == 4 then
Car2speed = getRandomInt(15, 25) *0.1
end
playAnim('phillyCars2', 'car'..Car2variant, false);
setProperty('phillyCars2.angle', 30);
doTweenAngle('phillyCars2TweenAngle', 'phillyCars2', -20, Car2speed, 'linear');
end
end
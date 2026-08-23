local nene = 'characters/abot/'
local neneAnim = false
abot = false;
local lol = true
function onUpdate()
if getProperty('health') <= 0.5 then
triggerEvent('Play Animation','lowerKnife','gf')
end
if getProperty('health') >= 1 then
end
end

function goodNoteHit(isSustainNote)
if combo == 50 then
characterPlayAnim('gf', 'combo50', true)
setProperty('gf.specialAnim',true)
setProperty('gf.danced', false)
runTimer('idleBeatNene', 1)
elseif combo == 200 then
characterPlayAnim('gf', 'combo200', true)
setProperty('gf.specialAnim',true)
setProperty('gf.danced', false)
runTimer('idleBeatNene', 1)
end
end

function onTimerCompleted(timer)
if timer == 'idleBeatNene' then
playAnim('gf','danceLeft',true)
setProperty('gf.specialAnim',true)
setProperty('gf.danced', true)
end
end

function onSongStart()
abot = true
end

function onCreatePost()
AbotVisible()
makeLuaSprite('stereo' , nene..'/stereoBG', 0, 0)
scaleLuaSprite('stereo', 1, 1)
addLuaSprite('stereo', false)

makeAnimatedLuaSprite('aBotViz', nene..'/aBotViz', 0, 0)
addAnimationByPrefix('aBotViz', 'viz1YEA', 'viz1', 12, false)
addAnimationByPrefix('aBotViz', 'viz1', 'viz10005', 12, true)
scaleLuaSprite('aBotViz', 1, 1)
addLuaSprite('aBotViz')

makeAnimatedLuaSprite('aBotViz2', nene..'/aBotViz', 0, 0)
addAnimationByPrefix('aBotViz2', 'viz2YEA', 'viz2', 12, false)
addAnimationByPrefix('aBotViz2', 'viz2', 'viz20005', 12, true)
scaleLuaSprite('aBotViz2', 1, 1)
addLuaSprite('aBotViz2')

makeAnimatedLuaSprite('aBotViz3', nene..'/aBotViz', 0, 0)
addAnimationByPrefix('aBotViz3', 'viz3YEA', 'viz3', 12, false)
addAnimationByPrefix('aBotViz3', 'viz3', 'viz30005', 12, true)
scaleLuaSprite('aBotViz3', 1, 1)
addLuaSprite('aBotViz3')

makeAnimatedLuaSprite('aBotViz4', nene..'/aBotViz', 0, 0)
addAnimationByPrefix('aBotViz4', 'viz4YEA', 'viz4', 12, false)
addAnimationByPrefix('aBotViz4', 'viz4', 'viz40005', 12, true)
scaleLuaSprite('aBotViz4', 1, 1)
addLuaSprite('aBotViz4')

makeAnimatedLuaSprite('aBotViz5', nene..'/aBotViz', 0, 0)
addAnimationByPrefix('aBotViz5', 'viz5YEA', 'viz5', 12, false)
addAnimationByPrefix('aBotViz5', 'viz5', 'viz50005', 12, true)
scaleLuaSprite('aBotViz5', 1, 1)
addLuaSprite('aBotViz5')

makeAnimatedLuaSprite('aBotViz6', nene..'/aBotViz', 0, 0)
addAnimationByPrefix('aBotViz6', 'viz6YEA', 'viz6', 12, false)
addAnimationByPrefix('aBotViz6', 'viz6', 'viz60005', 12, true)
scaleLuaSprite('aBotViz6', 1, 1)
addLuaSprite('aBotViz6')

makeAnimatedLuaSprite('aBotViz7', nene..'/aBotViz', 0, 0)
addAnimationByPrefix('aBotViz7', 'viz7YEA', 'viz7', 12, false)
addAnimationByPrefix('aBotViz7', 'viz7', 'viz70005', 12, true)
scaleLuaSprite('aBotViz7', 1, 1)
addLuaSprite('aBotViz7')

makeFlxAnimateSprite('Abot', 0, 0, nene..'/abotSystem')
addAnimationBySymbol('Abot', 'idle', 'Abot System',24,false)
addLuaSprite('Abot')

--abot
setProperty('Abot.x', 30)
setProperty('Abot.y', 500)
--viz - x
setProperty('aBotViz.x', 220)
setProperty('aBotViz2.x', 280)
setProperty('aBotViz3.x', 340)
setProperty('aBotViz4.x', 410)
setProperty('aBotViz5.x', 470)
setProperty('aBotViz6.x', 530)
setProperty('aBotViz7.x', 585)
--viz - y
setProperty('aBotViz.y', 580)
setProperty('aBotViz2.y', 575)
setProperty('aBotViz3.y', 570)
setProperty('aBotViz4.y', 570)
setProperty('aBotViz5.y', 570)
setProperty('aBotViz6.y', 575)
setProperty('aBotViz7.y', 585)
--stereo
setProperty('stereo.x', 190)
setProperty('stereo.y', 530)
end

function onBeatHit()
if abot then
playAnim('Abot', 'idle', true)
end
if curBeat % 2 == 0 then
playAnim('aBotViz2', 'viz2YEA', true)
end
playAnim('aBotViz', 'viz1YEA', true)
if curBeat % 3 == 0 then
playAnim('aBotViz3', 'viz3YEA', true)
end
if curBeat % 2 == 0 then
playAnim('aBotViz4', 'viz4YEA', true)
end
if curBeat % 4 == 0 then
playAnim('aBotViz5', 'viz5YEA', true)
end
if curBeat % 5 == 0 then
playAnim('aBotViz6', 'viz6YEA', true)
end
if curBeat % 3 == 0 then
playAnim('aBotViz7', 'viz7YEA', true)
end
end

function onUpdate()
if curStage == 'stage'
or curStage == 'tankmanBattlefieldErect'
or curStage == 'mallXmasErect' then
--abot
setProperty('Abot.x', 160)
setProperty('Abot.y', 450)
--viz - x
setProperty('aBotViz.x', 350)
setProperty('aBotViz2.x', 410)
setProperty('aBotViz3.x', 470)
setProperty('aBotViz4.x', 540)
setProperty('aBotViz5.x', 600)
setProperty('aBotViz6.x', 660)
setProperty('aBotViz7.x', 715)
--viz - y
setProperty('aBotViz.y', 570)
setProperty('aBotViz2.y', 565)
setProperty('aBotViz3.y', 550)
setProperty('aBotViz4.y', 550)
setProperty('aBotViz5.y', 550)
setProperty('aBotViz6.y', 555)
setProperty('aBotViz7.y', 565)
--stereo
setProperty('stereo.x', 320)
setProperty('stereo.y', 470)
end
if curStage == 'phillyStreets'
or curStage == 'phillyStreetsErect' then

--setProperty('gf.x', 1300)
--setProperty('gf.y', 1130)

setProperty('Abot.x', 1200)
setProperty('Abot.y', 1440)
setProperty('stereo.x', 1360)
setProperty('stereo.y', 1465)

setProperty('aBotViz.x', 1400)
setProperty('aBotViz.y', 1530)

setProperty('aBotViz2.x', 1460)
setProperty('aBotViz2.y', 1525)

setProperty('aBotViz3.x', 1515)
setProperty('aBotViz3.y', 1520)

setProperty('aBotViz4.x', 1585)
setProperty('aBotViz4.y', 1520)

setProperty('aBotViz5.x', 1643)
setProperty('aBotViz5.y', 1520)

setProperty('aBotViz6.x', 1700)
setProperty('aBotViz6.y', 1520)

setProperty('aBotViz7.x', 1755)
setProperty('aBotViz7.y', 1525)
end
if curStage == 'phillyBlazin' then
setProperty('Abot.x', 260)
setProperty('Abot.y', 500)
--viz - x
setProperty('aBotViz.x', 450)
setProperty('aBotViz2.x', 510)
setProperty('aBotViz3.x', 570)
setProperty('aBotViz4.x', 640)
setProperty('aBotViz5.x', 700)
setProperty('aBotViz6.x', 760)
setProperty('aBotViz7.x', 815)
--viz - y
setProperty('aBotViz.y', 580)
setProperty('aBotViz2.y', 575)
setProperty('aBotViz3.y', 570)
setProperty('aBotViz4.y', 570)
setProperty('aBotViz5.y', 570)
setProperty('aBotViz6.y', 575)
setProperty('aBotViz7.y', 585)
--stereo
setProperty('stereo.x', 420)
setProperty('stereo.y', 530)
end
end

function AbotNOTVisible()
setProperty('aBotViz.visible', false)
setProperty('aBotViz2.visible', false)
setProperty('aBotViz3.visible', false)
setProperty('aBotViz4.visible', false)
setProperty('aBotViz5.visible', false)
setProperty('aBotViz6.visible', false)
setProperty('aBotViz7.visible', false)
end

function AbotVisible()
setProperty('aBotViz.visible', true)
setProperty('aBotViz2.visible', true)
setProperty('aBotViz3.visible', true)
setProperty('aBotViz4.visible', true)
setProperty('aBotViz5.visible', true)
setProperty('aBotViz6.visible', true)
setProperty('aBotViz7.visible', true)
end
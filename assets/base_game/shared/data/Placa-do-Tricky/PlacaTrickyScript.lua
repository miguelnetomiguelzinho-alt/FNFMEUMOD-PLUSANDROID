function onCreate()
setProperty('cameraSpeed', 1.4)
end

function onStepHit()
if curStep == 110 then
setProperty('cameraSpeed', 0.5)

elseif curStep == 128 then
setProperty('cameraSpeed', 1.4)
cameraFlash('hud', 'ffffff', 1)

elseif curStep == 398 then
setProperty('vocals.volume', 0)
end
end
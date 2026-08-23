--Made by BlueColorsin#5597
--Inspired by Soulless DX

function onCreatePost()
    C4 = crochet / 1000 * (0.75)
	C1 = crochet / 1000 * (0.25)
end

TimesLol = 0
function onTweenCompleted(tag)
    if tag == tempVar1 then
        if TimesLol == 2 then TimesLol = 0 end
        TimesLol = TimesLol + 1 
        doTweenY(RNG(), 'iconP1', -10, C4, 'sineOut')
        doTweenY(RNG(), 'iconP2', -10, C4, 'sineOut')
        doTweenY(RNG(), 'camHUD', 0, C4, 'sineOut')
        if TimesLol == 1 then
            doTweenAngle(RNG(), 'iconP1', -3, C4)
            doTweenAngle(RNG(), 'iconP2', -3, C4)
            doTweenAngle(RNG(), 'camHUD', -0.5, C4)
        elseif TimesLol == 2 then
            doTweenAngle(RNG(), 'iconP1', 3, C4)
            doTweenAngle(RNG(), 'iconP2', 3, C4)
            doTweenAngle(RNG(), 'camHUD', 0.5, C4)
        end
    end
end

RNG = function () --returns a random number string
	return tostring(math.random())
end
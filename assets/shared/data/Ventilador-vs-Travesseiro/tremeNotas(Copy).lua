-- Script: Tremida com impacto nas setas do Player
-- Compatível com Psych Engine Mobile Port 0.7.3

local shakeActive = false
local shakeTimer = 0

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if getPropertyFromGroup('notes', id, 'mustPress') then
        shakeActive = true
        shakeTimer = 0.25 -- duração da tremida em segundos
    end
end

function onUpdate(elapsed)
    if shakeActive then
        shakeTimer = shakeTimer - elapsed
        local shake = math.sin(getSongPosition()/30) * 6 -- intensidade da tremida
        for i = 0,3 do
            local baseX = getPropertyFromGroup('playerStrums', i, 'x')
            setPropertyFromGroup('playerStrums', i, 'x', baseX + shake)
        end
        if shakeTimer <= 0 then
            shakeActive = false
            -- resetar posição original
            for i = 0,3 do
                local baseX = getPropertyFromGroup('playerStrums', i, 'x')
                setPropertyFromGroup('playerStrums', i, 'x', baseX)
            end
        end
    end
end
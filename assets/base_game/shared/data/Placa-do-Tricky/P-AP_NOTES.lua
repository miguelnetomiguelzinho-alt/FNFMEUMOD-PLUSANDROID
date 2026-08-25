-- Caos simplificado no Mobile
local chaosActive = false
local chaosTimer = 0

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    chaosActive = true
    chaosTimer = 0.3
end

function onUpdate(elapsed)
    if chaosActive then
        chaosTimer = chaosTimer - elapsed
        for i = 0, getProperty('notes.length')-1 do
            local baseX = getPropertyFromGroup('notes', i, 'x')
            local baseY = getPropertyFromGroup('notes', i, 'y')
            local offsetX = (math.random() * 20 - 10)
            local offsetY = (math.random() * 15 - 7)
            setPropertyFromGroup('notes', i, 'x', baseX + offsetX)
            setPropertyFromGroup('notes', i, 'y', baseY + offsetY)
        end
        if chaosTimer <= 0 then chaosActive = false end
    end
end
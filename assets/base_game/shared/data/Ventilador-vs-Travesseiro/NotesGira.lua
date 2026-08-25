local originalAngles = {}

function onCreatePost()
    for i = 0, 3 do
        originalAngles[i] = getPropertyFromGroup('opponentStrums', i, 'angle')
    end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if isSustainNote then
        return
    end

    local angle = math.random(-22, 22)
    setPropertyFromGroup('opponentStrums', noteData, 'angle', angle)
    runTimer('spinOpp' .. tostring(noteData), 0.25)
end

function onTimerCompleted(tag)
    if tag == 'spinOpp0' then
        setPropertyFromGroup('opponentStrums', 0, 'angle', originalAngles[0] or 0)
    elseif tag == 'spinOpp1' then
        setPropertyFromGroup('opponentStrums', 1, 'angle', originalAngles[1] or 0)
    elseif tag == 'spinOpp2' then
        setPropertyFromGroup('opponentStrums', 2, 'angle', originalAngles[2] or 0)
    elseif tag == 'spinOpp3' then
        setPropertyFromGroup('opponentStrums', 3, 'angle', originalAngles[3] or 0)
    end
end
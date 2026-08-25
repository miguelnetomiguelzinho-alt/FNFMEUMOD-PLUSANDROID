-- Player notes oscilando suavemente
local defaultNotePos = {}

function onSongStart()
    -- Guardar posição original das setas
    for i = 0,7 do
        local x = getPropertyFromGroup('strumLineNotes', i, 'x')
        local y = getPropertyFromGroup('strumLineNotes', i, 'y')
        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)
    local songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/60)

    -- Oscilação vertical suave nas notas do player
    for i = 4,7 do -- notas do player
        setPropertyFromGroup('strumLineNotes', i, 'y',
            defaultNotePos[i+1][2] + 25*math.sin((currentBeat+i*0.25)*math.pi))
    end
end
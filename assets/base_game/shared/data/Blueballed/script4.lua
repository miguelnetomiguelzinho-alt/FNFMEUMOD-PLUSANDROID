function opponentNoteHit()
    local diff = string.lower(difficultyName or '')

    -- Bloqueia Mechanics Off de qualquer forma
    if diff:find('mechanics') then
        return
    end

    -- Só drena no Hard
    if diff == 'hard' then
        local health = getProperty('health')
        if health > 0.1 then
            setProperty('health', health - 0.02)
        end
    end
end
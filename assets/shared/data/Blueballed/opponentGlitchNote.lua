--scripts by NTH208 (corrigido)
speedUpGlitch0, speedUpGlitch1, speedUpGlitch2, speedUpGlitch3 = false, false, false, false

function onCreatePost()
    initLuaShader("NewGlitch2")

    for i=0,3 do
        local tex = getPropertyFromGroup('opponentStrums', i, 'texture')
        setSpriteShader(tex, 'NewGlitch2')
        -- Se quiser também no player:
        -- local ptex = getPropertyFromGroup('playerStrums', i, 'texture')
        -- setSpriteShader(ptex, 'NewGlitch2')
    end
end

function onSongStart()
    for i=0,3 do
        noteTweenAlpha('note'..i, i, 1, 0.0001, 'linear')
    end
end

function onUpdate(e)
    for i=0,3 do
        local tex = getPropertyFromGroup('opponentStrums', i, 'texture')
        setShaderFloat(tex, "iTime", os.clock())
    end

    if speedUpGlitch0 then setShaderFloat(getPropertyFromGroup('opponentStrums',0,'texture'),'binaryIntensity',math.random(2,5)+1/math.random(1,3)) end
    if speedUpGlitch1 then setShaderFloat(getPropertyFromGroup('opponentStrums',1,'texture'),'binaryIntensity',math.random(2,5)+1/math.random(1,3)) end
    if speedUpGlitch2 then setShaderFloat(getPropertyFromGroup('opponentStrums',2,'texture'),'binaryIntensity',math.random(2,5)+1/math.random(1,3)) end
    if speedUpGlitch3 then setShaderFloat(getPropertyFromGroup('opponentStrums',3,'texture'),'binaryIntensity',math.random(2,5)+1/math.random(1,3)) end
end

function opponentNoteHit(id,data,type,sus)
    if data == 0 then speedUpGlitch0 = true runTimer('outSpeed0',0.15) end
    if data == 1 then speedUpGlitch1 = true runTimer('outSpeed1',0.15) end
    if data == 2 then speedUpGlitch2 = true runTimer('outSpeed2',0.15) end
    if data == 3 then speedUpGlitch3 = true runTimer('outSpeed3',0.15) end
end

function onTimerCompleted(tag)
    if tag=='outSpeed0' then speedUpGlitch0=false end
    if tag=='outSpeed1' then speedUpGlitch1=false end
    if tag=='outSpeed2' then speedUpGlitch2=false end
    if tag=='outSpeed3' then speedUpGlitch3=false end
end

function onStepHit()
    local random = math.random(1.5,6)
    if math.random(1,2) == 1 then random = 20 end
    for i=0,3 do
        setShaderFloat(getPropertyFromGroup('opponentStrums',i,'texture'),'binaryIntensity',random+1/math.random(1,3))
    end
end
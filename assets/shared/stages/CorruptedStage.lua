function onCreate()

    makeLuaSprite('Back', 'Back', 0, 0);
    scaleObject('Back', 1, 1)

    makeLuaSprite('Mid', 'Mid', 0, 800);
    scaleObject('Mid', 1, 1)

    makeLuaSprite('Front', 'Front', 0, 150);
    scaleObject('Front', 1, 1)

    addLuaSprite('Back', false);
    addLuaSprite('Mid', false);
    addLuaSprite('Front', true);

end


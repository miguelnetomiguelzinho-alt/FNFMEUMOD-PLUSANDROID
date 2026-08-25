function onCreate()

    makeLuaSprite('GambleBack', 'GambleBack', 0, 0);
    scaleObject('GambleBack', 3, 3);

    makeLuaSprite('GambleDark', 'GambleDark', 0, 0);
    scaleObject('GambleDark', 3, 3);
    
    makeLuaSprite('GambleLigth', 'GambleLigth', 0, 0);
    scaleObject('GambleLigth', 3, 3);

    addLuaSprite('GambleBack', false)
    addLuaSprite('GambleDark', true)
    addLuaSprite('GambleLigth', true)

end
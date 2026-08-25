function onCreate()
	makeLuaSprite('Cupheadbg','Cupheadbg',-880, -440)
	setLuaSpriteScrollFactor('Cupheadbg',1, 1);
	scaleObject('Cupheadbg', 1.49, 1.49);

	makeAnimatedLuaSprite('pcn_new_pibby','characters/pcn_new_pibby',1130,270);
    addAnimationByPrefix('pcn_new_pibby','idle export','idle export',24,true)
    setScrollFactor('pcn_new_pibby', 1, 1);
    scaleObject('pcn_new_pibby', 0.42, 0.42);

    makeLuaSprite('luna','luna',-420, -75)
	setLuaSpriteScrollFactor('luna',1, 1);
	scaleObject('luna', 1.49, 1.49);
    setBlendMode('luna', 'add')
	
    makeLuaSprite('cup black lol','cup black lol',-900, -440)
	setLuaSpriteScrollFactor('cup black lol',1, 1);
	scaleObject('cup black lol', 2.2, 2.2);
	
    addLuaSprite('Cupheadbg',false);
    addLuaSprite('pcn_new_pibby',true);
    addLuaSprite('luna',true);
    addLuaSprite('cup black lol',true);


end

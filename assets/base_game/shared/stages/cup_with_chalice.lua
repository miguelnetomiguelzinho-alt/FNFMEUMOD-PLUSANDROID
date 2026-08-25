function onCreate()
	makeLuaSprite('Sky','Sky',-1150, -740)
	setLuaSpriteScrollFactor('Sky',1.1, 1);
	scaleObject('Sky', 2.2, 2.2);

	makeLuaSprite('Trees','Trees',-1150, -700)
	setLuaSpriteScrollFactor('Trees',1.2, 1);
	scaleObject('Trees', 2.2, 2.2);
	
	makeLuaSprite('Cup','Cup',-1150, -740)
	setLuaSpriteScrollFactor('Cup',1, 1);
	scaleObject('Cup', 2.2, 2.2);

	makeLuaSprite('Dark','Dark',-1150, -740)
	setLuaSpriteScrollFactor('Dark',1.2, 1);
	scaleObject('Dark', 2.2, 2.2);

	makeLuaSprite('Shine','Shine',-1150, -740)
	setLuaSpriteScrollFactor('Shine',1.2, 1);
	scaleObject('Shine', 2.2, 2.2);
	


	makeAnimatedLuaSprite('pcn_new_pibby','characters/pcn_new_pibby',1630,560);
    addAnimationByPrefix('pcn_new_pibby','idle export','idle export',24,true)
    setScrollFactor('pcn_new_pibby', 1, 1);
    scaleObject('pcn_new_pibby', 0.42, 0.42);

    addLuaSprite('Sky',false);
	addLuaSprite('Trees',false);
	addLuaSprite('Cup',false);
    addLuaSprite('pcn_new_pibby',true); 	
	addLuaSprite('Dark',true);
	addLuaSprite('Shine',true);
  

end

function onCreatePost()
    makeAnimatedLuaSprite('pcnchalice', 'characters/pcn-chalice', 2880, 550);
    scaleObject('pcnchalice', 0.82, 0.82); 
    setPropertyLuaSprite('pcnchalice', 'flipX', true);
    addLuaSprite('pcnchalice', false);
    addAnimationByPrefix('pcnchalice', 'idle', 'idle', 24, true);
    setObjectOrder('pcnchalice',6);

end

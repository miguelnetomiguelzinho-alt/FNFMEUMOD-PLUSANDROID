function onCreate()
    if not lowQuality then
	-- background shit
	    makeLuaSprite('void','Vs Rennan/voideprincipal',0,0)
        setObjectCamera('void', 'camOther')
	    addLuaSprite('void', true);
	    
	    makeLuaSprite('ceu', 'Vs Rennan/ceu', -290, -450);
	    scaleObject('ceu', 0.65, 0.65);
	
	    makeLuaSprite('predioA', 'Vs Rennan/predio', -290, -450);
	    scaleObject('predioA', 0.65, 0.65);
	    setScrollFactor('predioA', 0.7, 0.7);
	
	    makeLuaSprite('predioB', 'Vs Rennan/predio2', -340, -375);
	    scaleObject('predioB', 0.65, 0.65);
	    setScrollFactor('predioB', 0.8, 0.8);
	
	    makeLuaSprite('chao', 'Vs Rennan/chao', -290, -450);
	    scaleObject('chao', 0.7, 0.65);
	    
	    makeAnimatedLuaSprite('CAIXA', 'Vs Rennan/SoundBox', 720, 440)
        addAnimationByPrefix('CAIXA', 'BEAT150', 'beat150', 18, true)
        addAnimationByPrefix('CAIXA', 'BEAT180', 'beat180', 18, true)
        addAnimationByPrefix('CAIXA', 'BEAT210', 'beat210', 18, true)
        scaleObject('CAIXA', 0.8, 0.8)
        
        makeAnimatedLuaSprite('gfbf', 'Vs Rennan/BFeGF', 350, 280)
        addAnimationByPrefix('gfbf', 'Ohmygod', 'idle', 18, true)
        scaleObject('gfbf', 0.7, 0.7)
        objectPlayAnimation('gfbf', 'Ohmygod', true)
	
	    makeLuaSprite('SOL', 'Vs Rennan/sol', -290, -275);
	    scaleObject('SOL', 0.75, 0.75);
	
		makeLuaSprite('Lizucha', 'Vs Rennan/LILIEVENTOS/Lili', 0, 470)
		scaleObject('Lizucha', 1.3, 1.3)
		
		makeLuaSprite('Lili', 'Vs Rennan/LILIEVENTOS/Liza', 2000, 470)
		scaleObject('Lili', 1.3, 1.3)
		setProperty('Lili.flipX', true)

		makeLuaSprite('meiaparede', 'Vs Rennan/meia-parede', -700, -800);
		setScrollFactor('meiaparede', 1.2, 1.2)
		
		makeLuaSprite('meiaparedeB', 'Vs Rennan/meia-parede', -900, -800);
		setScrollFactor('meiaparedeB', 1.2, 1.2)
		setProperty('meiaparedeB.flipX', true)
		
		makeLuaSprite('flare', 'Vs Rennan/flare', -100, -100);
		setScrollFactor('flare', 1.4, 1.4)
	    scaleObject('flare', 1.1, 1.1);
		
	    addLuaSprite('ceu', false);
	    addLuaSprite('predioB', false);
	    addLuaSprite('predioA', false);
	    addLuaSprite('chao', false);
	    addLuaSprite('CAIXA', false);
	    addLuaSprite('SOL', false);
		addLuaSprite('Lili', true)
		addLuaSprite('Lizucha', true)
	    addLuaSprite('meiaparede', true);
	    addLuaSprite('meiaparedeB', true);
	    addLuaSprite('flare', true)
	end
	
	if songName == 'What' then
	removeLuaSprite('Lizucha', false)
	
	elseif songName == 'Understandable' then
	setProperty('Lizucha.visible', false)
	end
end

function onBeatHit()
if curBeat % 2 == 0 and songName == 'Understandable' then
doTweenY('LILU', 'Lili', 480, 0.01)
doTweenY('LILU2', 'Lili', 470, 0.3)

doTweenY('LILU3', 'Lizucha', 480, 0.01)
doTweenY('LILU4', 'Lizucha', 470, 0.3)
end
end

function onStepHit()
if curStep == 1344 and songName == 'Understandable' then
doTweenX('LiLA', 'Lili', 0, 10)
end
end

function onTweenCompleted(tag)
if tag == 'LiLA' then
setProperty('Lizucha.visible', true)
setProperty('Lili.visible', false)
end
end
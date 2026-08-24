package options;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.sound.FlxSound;

class GameplaySettingsSubState extends BaseOptionsMenu
{
	// ===== overlay do aviso (sem openSubState) =====
	var warningActive:Bool = false;
	var pendingType:String = ''; // "mechanics" | "distraction"
	var warnBg:FlxSprite;
	var warnBox:FlxSprite;
	var warnTitle:FlxText;
	var warnMsg:FlxText;
	var warnTip:FlxText;

	public function new()
	{
		title = Language.getPhrase('gameplay_menu', 'Gameplay Settings');
		rpcTitle = 'Gameplay Settings Menu';

		// ===== MECÂNICAS DO MOD =====
		var option:Option = new Option(
			'Mechanics',
			'HELL = mecânicas pesadas (dodge = hitkill).\nAMADOR = mais leve (dodge tira metade da vida).\nOFF = nenhuma mecânica de drain/dodge.',
			'mechanicsMode',
			STRING,
			['HELL', 'AMADOR', 'OFF']
		);
		option.onChange = onChangeMechanicsMode;
		addOption(option);

		var optionDistraction:Option = new Option(
			'Distraction Mechanics',
			'Se desligado, usa charts sem notas de distração\n(ex: musica-MechDistr-Off.json).',
			'distractionMechanics',
			BOOL
		);
		optionDistraction.onChange = onChangeDistractionMechanics;
		addOption(optionDistraction);
		// ============================

		var option:Option = new Option('Downscroll',
			'If checked, notes go Down instead of Up, simple enough.',
			'downScroll',
			BOOL);
		addOption(option);

		var option:Option = new Option('Middlescroll',
			'If checked, your notes get centered.',
			'middleScroll',
			BOOL);
		addOption(option);

		var option:Option = new Option('Opponent Notes',
			'If unchecked, opponent notes get hidden.',
			'opponentStrums',
			BOOL);
		addOption(option);

		var option:Option = new Option('Ghost Tapping',
			"If checked, you won't get misses from pressing keys\nwhile there are no notes able to be hit.",
			'ghostTapping',
			BOOL);
		addOption(option);

		var option:Option = new Option('Bad and Shit Break Combo',
			"If checked, hitting Bad or Shit notes will break your combo\nand count as Combo Breaks instead of just Misses.",
			'badShitBreakCombo',
			BOOL);
		addOption(option);

		var option:Option = new Option('Auto Pause',
			"If checked, the game automatically pauses if the screen isn't on focus.",
			'autoPause',
			BOOL);
		addOption(option);
		option.onChange = onChangeAutoPause;

		#if windows
		var option:Option = new Option('Windows GDI Effects',
			'Allows Windows desktop GDI effects. Keep disabled unless you explicitly want mods to use them.',
			'windowsGDIEffects',
			BOOL);
		addOption(option);
		option.onChange = onChangeWindowsGDIEffects;
		#end

		var option:Option = new Option('Pop Up Score',
			"If unchecked, hitting notes won't make \"sick\", \"good\".. and combo popups\n(Useful for low end " + Main.platform + ").",
			'popUpRating',
			BOOL);
		addOption(option);

		var option:Option = new Option('Disable Reset Button',
			"If checked, pressing Reset won't do anything.",
			'noReset',
			BOOL);
		addOption(option);

		#if mobile
		var option:Option = new Option('Game Over Vibration',
			"If checked, your device will vibrate at game over.",
			'gameOverVibration',
			BOOL);
		addOption(option);
		option.onChange = onChangeVibration;
		#end

		var option:Option = new Option('Sustains as One Note',
			"If checked, Hold Notes can't be pressed if you miss,\nand count as a single Hit/Miss.\nUncheck this if you prefer the old Input System.",
			'guitarHeroSustains',
			BOOL);
		addOption(option);

		var option:Option = new Option('Hitsound in what way',
			'If checked, note and keys do a hitsound when pressed!, else just when notes are hit!',
			'hitsoundType',
			STRING,
			['None', 'Keys', 'Notes']);
		addOption(option);

		var option:Option = new Option('Hitsound Volume',
			'Funny notes does \"Tick!\" when you hit them.',
			'hitsoundVolume',
			PERCENT);
		addOption(option);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.1;
		option.decimals = 1;
		option.onChange = onChangeHitsoundVolume;

		var option:Option = new Option('Hitsound',
			'Funny notes does \"Any Sound\" when you hit them.',
			'hitSounds',
			STRING,
			['None', 'quaver', 'osu', 'clap', 'camellia', 'stepmania', '21st century humor', 'vine boom', 'sexus']);
		addOption(option);
		option.onChange = onChangeHitsound;

		var option:Option = new Option('Rating Offset',
			'Changes how late/early you have to hit for a "flawless!!"\nHigher values mean you have to hit later.',
			'ratingOffset',
			INT);
		option.displayFormat = '%vms';
		option.scrollSpeed = 20;
		option.minValue = -30;
		option.maxValue = 30;
		addOption(option);

		var option:Option = new Option('Flawless!! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Flawless!!" in milliseconds.',
			'flawlessWindow',
			FLOAT);
		option.displayFormat = '%vms';
		option.scrollSpeed = 5;
		option.minValue = 15.0;
		option.maxValue = 25.0;
		option.changeValue = 0.1;
		addOption(option);

		var option:Option = new Option('Sick! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Sick!" in milliseconds.',
			'sickWindow',
			FLOAT);
		option.displayFormat = '%vms';
		option.scrollSpeed = 15;
		option.minValue = 15.0;
		option.maxValue = 45.0;
		option.changeValue = 0.1;
		addOption(option);

		var option:Option = new Option('Good Hit Window',
			'Changes the amount of time you have\nfor hitting a "Good" in milliseconds.',
			'goodWindow',
			FLOAT);
		option.displayFormat = '%vms';
		option.scrollSpeed = 30;
		option.minValue = 15.0;
		option.maxValue = 90.0;
		option.changeValue = 0.1;
		addOption(option);

		var option:Option = new Option('Bad Hit Window',
			'Changes the amount of time you have\nfor hitting a "Bad" in milliseconds.',
			'badWindow',
			FLOAT);
		option.displayFormat = '%vms';
		option.scrollSpeed = 60;
		option.minValue = 15.0;
		option.maxValue = 135.0;
		option.changeValue = 0.1;
		addOption(option);

		var option:Option = new Option('Safe Frames',
			'Changes how many frames you have for\nhitting a note earlier or late.',
			'safeFrames',
			FLOAT);
		option.scrollSpeed = 5;
		option.minValue = 2;
		option.maxValue = 10;
		option.changeValue = 0.1;
		addOption(option);

		var option:Option = new Option('Accuracy System',
			"Choose the accuracy calculation system:\nWife3 - StepMania precision timing\nPsych - Rating mod based\nSimple - Basic hits/total\nosu!mania - Weighted judgement system\nDJMAX - Combo bonus system\nITG - Dance Points system\n\n",
			'accuracySystem',
			STRING,
			['Wife3', 'Psych', 'Simple', 'osu!mania', 'DJMAX', 'ITG']);
		addOption(option);

		var option:Option = new Option('System Score Multiplier',
			"Choose the scoring system for note hits",
			'systemScoreMultiplier',
			STRING,
			['Psych', 'Codename']);
		addOption(option);

		super();
	}

	var daHitSound:FlxSound = new FlxSound();

	// ===== AVISO EM OVERLAY (não trava menu) =====
	function showWarning(type:String)
	{
		if (warningActive) return;
		warningActive = true;
		pendingType = type;

		warnBg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		warnBg.alpha = 0.75;
		warnBg.scrollFactor.set();
		add(warnBg);

		warnBox = new FlxSprite().makeGraphic(700, 320, 0xFF1A1A1A);
		warnBox.scrollFactor.set();
		warnBox.screenCenter();
		add(warnBox);

		warnTitle = new FlxText(0, warnBox.y + 24, 660, "ATENÇÃO!", 36);
		warnTitle.setFormat(Paths.font("vcr.ttf"), 36, FlxColor.RED, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		warnTitle.borderSize = 2;
		warnTitle.scrollFactor.set();
		warnTitle.screenCenter(X);
		add(warnTitle);

		warnMsg = new FlxText(0, warnTitle.y + 55, 640,
			"Se você desativar essas opções, você pode perder um pouco de empolgação do Mod.\n\nDeseja realmente desativá-las?",
			22);
		warnMsg.setFormat(Paths.font("vcr.ttf"), 22, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		warnMsg.borderSize = 1;
		warnMsg.scrollFactor.set();
		warnMsg.screenCenter(X);
		add(warnMsg);

		warnTip = new FlxText(0, warnBox.y + warnBox.height - 70, 640, "A / SIM   |   B / NÃO", 20);
		warnTip.setFormat(Paths.font("vcr.ttf"), 20, 0xFFAAAAAA, CENTER);
		warnTip.scrollFactor.set();
		warnTip.screenCenter(X);
		add(warnTip);
	}

	function hideWarning(yes:Bool)
	{
		if (!warningActive) return;
		warningActive = false;

		if (warnBg != null) { remove(warnBg); warnBg.destroy(); warnBg = null; }
		if (warnBox != null) { remove(warnBox); warnBox.destroy(); warnBox = null; }
		if (warnTitle != null) { remove(warnTitle); warnTitle.destroy(); warnTitle = null; }
		if (warnMsg != null) { remove(warnMsg); warnMsg.destroy(); warnMsg = null; }
		if (warnTip != null) { remove(warnTip); warnTip.destroy(); warnTip = null; }

		if (pendingType == 'mechanics')
		{
			if (yes)
			{
				ClientPrefs.data.mechanicsMode = 'OFF';
				ClientPrefs.mechanicsMode = 'OFF';
				ClientPrefs.data.mechanicsWarningSeen = true;
				ClientPrefs.mechanicsWarningSeen = true;
			}
			else
			{
				ClientPrefs.data.mechanicsMode = 'AMADOR';
				ClientPrefs.mechanicsMode = 'AMADOR';
			}
		}
		else if (pendingType == 'distraction')
		{
			if (yes)
			{
				ClientPrefs.data.distractionMechanics = false;
				ClientPrefs.distractionMechanics = false;
				ClientPrefs.data.mechanicsWarningSeen = true;
				ClientPrefs.mechanicsWarningSeen = true;
			}
			else
			{
				ClientPrefs.data.distractionMechanics = true;
				ClientPrefs.distractionMechanics = true;
			}
		}

		pendingType = '';
		ClientPrefs.saveSettings();
		controls.isInSubstate = false;
	}

	override function update(elapsed:Float)
	{
		// enquanto o aviso estiver na tela, só A/B funcionam
		if (warningActive)
		{
			if (controls.ACCEPT || (touchPad != null && touchPad.buttonA != null && touchPad.buttonA.justPressed))
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));
				hideWarning(true);
			}
			else if (controls.BACK || (touchPad != null && touchPad.buttonB != null && touchPad.buttonB.justPressed))
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				hideWarning(false);
			}
			return; // NÃO chama super = menu não processa por baixo
		}

		super.update(elapsed);
	}

	function onChangeMechanicsMode()
	{
		if (ClientPrefs.data.mechanicsMode == 'OFF' && !ClientPrefs.data.mechanicsWarningSeen)
		{
			// volta pro valor seguro até confirmar
			ClientPrefs.data.mechanicsMode = 'AMADOR';
			ClientPrefs.mechanicsMode = 'AMADOR';
			showWarning('mechanics');
		}
		else
		{
			ClientPrefs.mechanicsMode = ClientPrefs.data.mechanicsMode;
			ClientPrefs.saveSettings();
		}
	}

	function onChangeDistractionMechanics()
	{
		if (!ClientPrefs.data.distractionMechanics && !ClientPrefs.data.mechanicsWarningSeen)
		{
			ClientPrefs.data.distractionMechanics = true;
			ClientPrefs.distractionMechanics = true;
			showWarning('distraction');
		}
		else
		{
			ClientPrefs.distractionMechanics = ClientPrefs.data.distractionMechanics;
			ClientPrefs.saveSettings();
		}
	}

	function onChangeHitsound()
	{
		if (ClientPrefs.data.hitSounds != "None" && ClientPrefs.data.hitsoundVolume != 0)
		{
			daHitSound.loadEmbedded(Paths.sound('hitsounds/${ClientPrefs.data.hitSounds}'));
			daHitSound.volume = ClientPrefs.data.hitsoundVolume;
			daHitSound.play();
		}
	}

	function onChangeHitsoundVolume()
	{
		if (ClientPrefs.data.hitSounds != "None")
		{
			daHitSound.loadEmbedded(Paths.sound('hitsounds/${ClientPrefs.data.hitSounds}'));
			daHitSound.volume = ClientPrefs.data.hitsoundVolume;
			daHitSound.play();
		}
		else
			FlxG.sound.play(Paths.sound('hitsound'), ClientPrefs.data.hitsoundVolume);
	}

	function onChangeAutoPause()
		FlxG.autoPause = ClientPrefs.data.autoPause;

	#if windows
	function onChangeWindowsGDIEffects()
	{
		if (!ClientPrefs.data.windowsGDIEffects)
			slushithings.windows.WindowsAPI.stopGDIThread();
	}
	#end

	function onChangeVibration()
	{
		if (ClientPrefs.data.gameOverVibration)
			lime.ui.Haptic.vibrate(0, 500);
	}
}
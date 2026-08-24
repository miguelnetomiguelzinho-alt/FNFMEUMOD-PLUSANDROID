package options;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;

class MechanicsConfirmSubstate extends MusicBeatSubstate
{
	var onResult:Bool->Void; // true = SIM (desliga), false = NÃO (volta pro ON)

	public function new(onResult:Bool->Void)
	{
		this.onResult = onResult;
		super();
	}

	override function create()
	{
		controls.isInSubstate = true;

		var bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0.75;
		bg.scrollFactor.set();
		add(bg);

		var box = new FlxSprite().makeGraphic(700, 320, 0xFF1A1A1A);
		box.scrollFactor.set();
		box.screenCenter();
		add(box);

		var title = new FlxText(0, box.y + 24, 660, "ATENÇÃO!", 36);
		title.setFormat(Paths.font("TPOT.ttf"), 36, FlxColor.RED, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		title.borderSize = 2;
		title.scrollFactor.set();
		title.screenCenter(X);
		add(title);

		var msg = new FlxText(0, title.y + 55, 640,
			"Se você desativar essas opções, você pode perder um pouco de empolgação do Mod.\n\nDeseja realmente desativá-las?",
			22);
		msg.setFormat(Paths.font("TPOT.ttf"), 22, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		msg.borderSize = 1;
		msg.scrollFactor.set();
		msg.screenCenter(X);
		add(msg);

		var tip = new FlxText(0, box.y + box.height - 70, 640, "A / SIM   |   B / NÃO", 20);
		tip.setFormat(Paths.font("TPOT.ttf"), 20, 0xFFAAAAAA, CENTER);
		tip.scrollFactor.set();
		tip.screenCenter(X);
		add(tip);

		addTouchPad('NONE', 'A_B');
		addTouchPadCamera();

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT || (touchPad != null && touchPad.buttonA.justPressed))
		{
			FlxG.sound.play(Paths.sound('confirmMenu'));
			closeWith(true); // SIM → mantém desligado
		}
		else if (controls.BACK || (touchPad != null && touchPad.buttonB.justPressed))
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			closeWith(false); // NÃO → volta pro ON
		}
	}

	function closeWith(yes:Bool)
	{
		if (onResult != null)
			onResult(yes);
		controls.isInSubstate = false;
		close();
	}
}
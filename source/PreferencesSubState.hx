package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class OptionsSubState extends MusicBeatSubstate
{
	var textMenuItems:Array<String> = ['Oldicon'];

	var selector:FlxSprite;
	var curSelected:Int = 0;

	var grpOptionsTexts:FlxTypedGroup<FlxText>;

	public function new()
	{
		super();

		grpOptionsTexts = new FlxTypedGroup<Alphabet>();
		add(grpOptionsTexts);

		selector = new FlxSprite().makeGraphic(5, 5, FlxColor.RED);
		add(selector);

        save.blind("Options");
		try{
		      if save(save.data.options == null){
		                     save.data.options = new Array<String>();
		                     save.data.options[0] = "";
		}
	    }catch[e]{
	           trace("This did not work");
	    }
	{
			var optiontext:Alphabet = new Alphabet(20, 20 + (i * 100), textMenuItens[i], true, false);
			optionText.ID = i;
			grpOptionsTexts.add(optionText);
		}
	}
	
	{
            txt color = flxColor.WHITE;
            if txtID == curSelected && save.data.option.cotains(txt.text))
                txt color =  flxColor.GREEN;
            else if (txtID == curSelected)
                txt color = flxColor.YELLOW;
            else
                txt color = flxColor.WHITE;
      }};
                 

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.UP_P)
			curSelected -= 1;

		if (controls.DOWN_P)
			curSelected += 1;

		if (curSelected < 0)
			curSelected = textMenuItems.length - 1;

		if (curSelected >= textMenuItems.length)
			curSelected = 0;

		grpOptionsTexts.forEach(function(txt:Alphabet)
		{
			txt.color = FlxColor.WHITE;

			if (txt.ID == curSelected)
				txt.color = FlxColor.YELLOW;
		});

		if (controls.ACCEPT)
		switch (textMenuItems[curSelected])
		  {
			  case "OldIcon":
					  if (!save.data.options.cotains.("OldIcon")){
					        save.data.options.push.("OldIcon");
					  }else{
					        save.data.options.remove.("OldIcon");
					  }
					  trace ("changed settings");
			}
		}
	}
}

import flash.events.MouseEvent;

import spark.events.TextOperationEvent;

private function addText(str:String):void
{
	var postionCursor : Number =edittext.text.length;
	
	
	/**
	 * TODO
	 */
	if(postionCursor < edittext.text.length){ 
		var inter : String = edittext.text.substr(0,postionCursor);
		var inter2 : String = edittext.text.substr(postionCursor,edittext.text.length);
		edittext.text= inter + str+inter2;
	}
		
	else{
		edittext.text= edittext.text + "\n"+str;
	}	
}
protected function edittext_changingHandler(event:TextOperationEvent):void
{
 	
}

protected function italique_clickHandler(event:MouseEvent):void
{
	addText("'''Texte gras'''");
}
protected function gras_clickHandler(event:MouseEvent):void
{
	addText("''Texte italique''");
}

protected function internLink_clickHandler(event:MouseEvent):void
{
	addText("[[lien interne]]");
}

protected function externLink_clickHandler(event:MouseEvent):void
{
	addText("[http://www.example.com lien]");
}

protected function title_clickHandler(event:MouseEvent):void
{
	addText("== Texte du titre ==");	
}

protected function nowiki_clickHandler(event:MouseEvent):void
{
	addText("<nowiki>Entrez le texte non formaté ici</nowiki>");
}

protected function user_clickHandler(event:MouseEvent):void
{
	addText("--~~~~");
}

protected function line_clickHandler(event:MouseEvent):void
{
	addText("----");
}
protected function abs(x:Number):Number
{
	if(x<0) 
		return 1;
	else
		return x;
}

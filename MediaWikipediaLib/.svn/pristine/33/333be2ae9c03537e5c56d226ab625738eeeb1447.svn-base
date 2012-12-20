package main
{
	import flash.events.Event;
	import flash.html.HTMLLoader;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;
	import mx.controls.HTML;
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import servicescalled.mediawikigetter.LocalService;
	
	
	
	public class MediaWikiCaller extends Caller
	{
		protected var service  : LocalService;
		
		override public function MediaWikiCaller(urlServer:String)
		{
			super(urlServer);
			service = new LocalService(urlserver)  ;
		}
		
		
		/**
		 * Content Page with name title
		 * @param title : the name of page
		 * @param callbackfunction : the function that wil be called when the Even.COMPLETE is getted
		 */
		public function getContentPage(title: String, callbackfunction:*):void
		{
			if(debug)	Alert.show("get content");
			response.token = service.WikiGetContentPage("query","revisions",title,"content",format);
			response.addEventListener(ResultEvent.RESULT,callbackfunction);
		}
		
		/**
		 * edit Page
		 * @param title : the name of page.
		 * @param text : the new text.
		 * @param token : associed to the user who want to edit page.
		 * @param callbackfunction : the function that wil be called when the Even.COMPLETE is getted
		 */
		public function editPage(title: String, text:String,token:String, callbackfunction:*):void
		{
			if(debug)	Alert.show("edit Page");
			response.token = service.WikiEditPage("edit",title,text,token,"json");
			response.addEventListener(ResultEvent.RESULT,callbackfunction);
		}
	}
}
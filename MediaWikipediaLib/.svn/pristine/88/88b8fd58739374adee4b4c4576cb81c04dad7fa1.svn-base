package main
{
	import mx.controls.Alert;
	import mx.rpc.CallResponder;
	import mx.rpc.events.ResultEvent;
	
	import servicescalled.mediawikigetter.LocalService;

	public class Autentification extends MediaWikiCaller
	{
		
		
		
		/**
		 * Constructor
		 */
		override public function Autentification(urlserver:String)
		{
			super(urlserver);
		}
		
		
		
		/**
		 * login in with user, name and token
		 * @param user
		 * @param password
		 * @param token
		 * @param callbackfunction : the function that wil be called when the Even.COMPLETE is getted
		 */
		public function login(user: String,password: String, token:String,callbackfunction:*):void
		{
			if(debug)	Alert.show("login");
			response.token = service.WikiLogIn("login",user,password,token,format);
			response.addEventListener(ResultEvent.RESULT,callbackfunction);
		}
		
		
		/**
		 * login in with user, name and token
		 * @param user
		 * @param password
		 * @param token
		 * @param callbackfunction : the function that wil be called when the Even.COMPLETE is getted
		 */
		public function logout(callbackfunction:*):void
		{
			if(debug)	Alert.show("logout");
			response.token = service.WikiLogOut("logout");
			response.addEventListener(ResultEvent.RESULT,callbackfunction);
		}
		
	}
}
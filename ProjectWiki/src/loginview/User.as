package loginview
{
	import flash.events.Event;
	
	import flashx.textLayout.operations.PasteOperation;
	
	import mx.messaging.channels.StreamingAMFChannel;
	import mx.rpc.CallResponder;
	import mx.rpc.events.ResultEvent;
	
	import servicescalled.mediawikigetter.LocalService;
	
	/**Singleton class*/
	public class User
	{
		private var id : String = null;
		private var name : String = null;
		private var token : String = null;
		private var cookiePrefix : String = null;
		private var sessionId : String = null;
		private var editToken : String = null;

		
		private var created : Boolean = false;
		
		private static var user:User = null;
		
		private var responder:CallResponder = new CallResponder();//The service
		private var service:LocalService = new LocalService("http://127.0.0.1/wiki/api.php");//The responder

		public static function getUser():User{
			if(user){
				return user;
			}else{
				user = new User();
				user.initEditToken();
				return user;
			}
		}
		
		/**Getters*/
		public function getId():String{return id;}
		public function getName():String{return name;}
		public function getToken():String{return token;}
		public function getCookie():String{return cookiePrefix;}
		public function getSession():String{return sessionId;}
		public function getCreated():Boolean{return created;}
		public function getEditToken():String{return editToken;}
		
		/**Setters*/
		public function setId(Id:String):void{id=Id;}
		public function setName(Name:String):void{name=Name;}
		public function setToken(Token:String):void{token=Token;}
		public function setCookie(Cokie:String):void{cookiePrefix=Cokie;}
		public function setSession(Session:String):void{sessionId=Session;}
		public function setEditToken(edit:String):void{editToken = edit;}
		
		/**Created value is seton true, only if the other entitys are set*/
		public function setCreated(Created:Boolean):void{
			if(id!=null && name!=null && token!=null && cookiePrefix!=null && sessionId!=null){
				created=Created;
			}
		}
		
		/** Call the api to initialise the edit token for the specific user, called after the user is loged in */
		private function initEditToken():void{
			responder.token = service.WikiGetEditToken("query", "info", "edit", "exemple", "xml");
			responder.addEventListener(ResultEvent.RESULT, doInitToken);
		}
		
		private function doInitToken(event:Event):void{
			editToken = responder.lastResult.api.query.pages.page.edittoken;
		}
		
		public function toString():String
		{
			return name+" "+id+" "+token+" "+cookiePrefix+" "+sessionId+" "+created+" "+editToken+" ";	
		}
	}
	
}
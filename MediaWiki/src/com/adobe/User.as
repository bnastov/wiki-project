package com.adobe
{
	import mx.messaging.channels.StreamingAMFChannel;
	
	/**Singleton class*/
	public class User
	{
		private var id : String = null;
		private var name : String = null;
		private var token : String = null;
		private var cookiePrefix : String = null;
		private var sessionId : String = null;
		
		private var created : Boolean = false;
		
		private static var user:User = null;
		
		
		public static function getUser():User{
			if(user){
				return user;
			}else{
				user = new User();
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
		
		/**Setters*/
		public function setId(Id:String):void{id=Id;}
		public function setName(Name:String):void{name=Name;}
		public function setToken(Token:String):void{token=Token;}
		public function setCookie(Cokie:String):void{cookiePrefix=Cokie;}
		public function setSession(Session:String):void{sessionId=Session;}
		
		/**Created value is seton true, only if the other entitys are set*/
		public function setCreated(Created:Boolean):void{
			if(id!=null && name!=null && token!=null && cookiePrefix!=null && sessionId!=null){
				created=Created;
			}
		}
	}
}
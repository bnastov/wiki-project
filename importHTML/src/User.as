package
{
	public class User
	{
		private var id : String;
		private var name : String;
		private var token : String;
		private var cookiePrefix : String;
		private var sessionId : String;
		
		
		
		public function User(Id:String, Name:String, Token:String, Cookie:String, Session:String)
		{
			id=Id;
			name=Name;
			token=Token;
			cookiePrefix=Cookie;
			sessionId=Session;
		}
	}
}
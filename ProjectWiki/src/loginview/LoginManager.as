package loginview
{
	import database.Persitance;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.sampler.NewObjectSample;
	
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.core.UIComponent;
	import mx.rpc.CallResponder;
	import mx.rpc.Fault;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import servicescalled.mediawikigetter.LocalService;
	
	import spark.components.Application;
	import spark.components.Label;
	import spark.modules.Module;
	
	import utils.Config;
	
	/**
	 * Loading manager interconnect the local user account
	 * with wediawiki account
	 * 
	 * */
	public class LoginManager
	{	
		private var loginModule:Login;//The login module
		
		private var responder:CallResponder;//The service
		private var service:LocalService;//The responder
		
		private var internUser:String;//user
		private var internPassword:String//password
		
		public function LoginManager(module:Login){
			loginModule = module;
			service = new LocalService(Config.urlserverapi);
			responder = new CallResponder();
			responder.addEventListener(FaultEvent.FAULT,fault);
		}
		protected function fault(event : FaultEvent):void
		{
			Alert.show("Title : "+event.fault.faultString+"\n\nDetails : "+event.fault.faultDetail,event.fault.faultCode);
		}
		
		
		/**Login function*/
		public function login(user:String, password:String):void{
			callLoginService(user, password, "");
		}
		
		/**Function that calls the service*/
		private function callLoginService(user:String, password:String, token:String):void{
			internUser = user;
			internPassword = password;
			responder.token = service.WikiLogIn("login", internUser, internPassword, token, "xml");
			responder.addEventListener(ResultEvent.RESULT, loginResult);
		}
		
		/**Service result handler*/
		private function loginResult(event:Event):void{
			//Alert.show(responder.lastResult);	
			dispatch(responder.lastResult);
		}
		
		/**function that dispath the result of the servise 
		 * if token needed, provide the token and recall with the provided token*/
		private function dispatch(resultLogin:Object):void{
			var result:Object = resultLogin.api.login.result;	
			
			if(result == "Success"){
				loginComplete(resultLogin);
			}
			if(result == "NeedToken"){
				//Faire appel au servire de login avec le token
				callLoginService(internUser, internPassword, resultLogin.api.login.token);	
			}
			if(result == "NoName"){
				setStatus("Please insert your user name");
			}
			if(result == "Illegal"){
				loginModule.clearForm();
				setStatus("Illegal username, please try again");
			}
			if(result == "NotExists"){
				loginModule.clearForm();
				setStatus("The username you provided doesn't exist");
			}
			if(result == "EmptyPass"){
				setStatus("Please insert your password");
			}
			if(result == "WrongPass"){
				loginModule.password.text = "";
				setStatus("Wrong password, please try again");
			}
			if(result == "WrongPluginPass"){
				loginModule.password.text = "";
				setStatus("Wrong password, please try again");
			}
			if(result == "CreateBlocked"){
				loginModule.clearForm();
				setStatus("Sorry your IP is blocked");
			}
			if(result == "Throttled"){
				loginModule.clearForm();
				setStatus("You've logged in too many times in a short time");
			}
			if(result == "Blocked"){
				loginModule.clearForm();
				setStatus("Blocked user");
			}
		}
		
		/**Called after the login service successed, to set the user and change the state */
		private function loginComplete(resultLogin:Object):void{
			createUser(resultLogin.api.login.lguserid,
				resultLogin.api.login.lgusername,
				resultLogin.api.login.lgtoken,
				resultLogin.api.login.cookieprefix,
				resultLogin.api.login.sessionid);
			
			initConnectedState();
		}
		
		private function initConnectedState():void{
			
			loginModule.parentApplication.setCurrentState("Search",true);
			if(loginModule.parentApplication.menuing != null){
				loginModule.parentApplication.menuing.setUserName(User.getUser().getName());
			}
		}
		
		private function setStatus(text:String):void{
			loginModule.status.text = text;
			loginModule.status.visible = true;
		}
		
		/**Initialising the user, paramether creater is set*/
		private function createUser(id:String, name:String, token:String, cookie:String, session:String):void{
			User.getUser().setId(id);
			User.getUser().setName(name);
			User.getUser().setToken(token);
			User.getUser().setCookie(cookie);
			User.getUser().setSession(session);
			User.getUser().setCreated(true);
			loginModule.parentApplication.db.insertUser(token,name);
		}
	}
}
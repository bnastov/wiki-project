package main
{
	import com.adobe.fiber.services.wrapper.HTTPServiceWrapper;
	
	import mx.controls.Alert;
	import mx.rpc.CallResponder;
	import mx.rpc.events.FaultEvent;

	internal class Caller
	{
		protected var response   : CallResponder;
		protected var urlserver : String;
		protected var format : String = "xml";
		protected var debug : Boolean = false;
		
		
		/**
		 * Getter Response
		 */
		public function get Response():CallResponder
		{
			return response;	
		}
		
		public function get UrlService():String
		{
			return urlserver;	
		}
		
		public function set Format(formatReturnd : String):void
		{
			format = formatReturnd;	
		}
		
		public function set Debug(value : Boolean):void
		{
			debug= value;	
		}
		
		public function get Format():String
		{
			return format;	
		}
		
		public function get Debug():Boolean
		{
			return debug;	
		}
		
		/**
		 * Constructor
		 */
		public function Caller(urlserver:String)
		{
			this.urlserver= urlserver;
			response = new CallResponder();
			response.addEventListener(FaultEvent.FAULT, fault);
		}
		
		/**
		 * for the Fault Service
		 */
		protected function fault(event : FaultEvent):void
		{
			Alert.show("Title : "+event.fault.faultString+"\n\nDetails : "+event.fault.faultDetail,event.fault.faultCode);
		}
	}
}
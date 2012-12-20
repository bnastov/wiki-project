package utils
{
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mx.controls.Alert;

	public class Config
	{
		public static var urlserver : String = "";
		public static var urlserverapi : String = "";//"http://127.0.0.1:8887/mediawiki-1.20.0/api.php";
		public static var urlserverget : String = "";//"http://127.0.0.1:8887/mediawiki-1.20.0/index.php";
		public static var urlserverload : String = "";//"http://127.0.0.1:8887/mediawiki-1.20.0/load.php";
		
		public function Config()
		{
			
		}
		
		public static function reloadConfig():void{
			changeServerUrl("http://127.0.0.1:8887/mediawiki-1.20.0/");
		}
		
		protected static function charger(ev:Event): void{
			var xml:XML = new XML(ev.currentTarget.data);
			var str:String  = xml;
			urlserver     = str;
			urlserverapi =  str +"api.php";
			urlserverget =  str +"index.php";
			urlserverload = str +"load.php";
		}
		
		public static function changeServerUrl(url:String):void{
			urlserver     = url;
			urlserverapi  = url +"api.php";
			urlserverget  = url +"index.php";
			urlserverload = url +"load.php";
		}
	}
}
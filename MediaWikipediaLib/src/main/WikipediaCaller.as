package main
{
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;
	
	import servicescalled.wikipediagetter.WikipediaGetter;

	public class WikipediaCaller extends Caller
	{
		protected var service  : WikipediaGetter;
		
		/**
		 * Constructor
		 */
		override public function WikipediaCaller(urlServer:String)
		{
			super(urlServer);
			service = new WikipediaGetter(urlServer);
		}
		
		/**
		 * Search Page in Wikipedia EndPoint
		 * @param title : the name of page
		 * @param number : the number of results returned
		 * @param callbackfunction : the function that wil be called when the Even.COMPLETE is getted
		 */
		public function Search(title: String, number:String,callbackfunction:*):void
		{
			if(debug)	Alert.show("search title ");
			response.token = service.WikipediaSearch("query","allpages",title,format,"nonredirects",number);
			response.addEventListener(ResultEvent.RESULT,callbackfunction);
		}
		
		
		/**
		 * Search Page in Wikipedia EndPoint
		 * @param title : the name of page
		 * @param number : the number of results returned
		 * @param callbackfunction : the function that wil be called when the Even.COMPLETE is getted
		 */
		public function ExtractPage(title: String, callbackfunction:*):void
		{
			if(debug)	Alert.show("extract Page");
			response.token = service.WikipediaExtract("query","extracts",title,format);
			response.addEventListener(ResultEvent.RESULT,callbackfunction);
		}
	}
}
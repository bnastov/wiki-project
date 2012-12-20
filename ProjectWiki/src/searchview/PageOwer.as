package searchview
{
	/**
	 * Class For Pages Wikipédia search results 
	 */
	public class PageOwer
	{
		/**
		 * Id of Page
		 */
		public var pageid: Number;
		
		
		/**
		 * Title for Page (label for the cast To String in data);
		 */
		
		public var label : String;
		
		
		public function PageOwer()
		{
		}
		
		
		/**
		 * parse Properties from XML
		 */ 
		public function parse(page : Object):void
		{
			if(page.hasOwnProperty("pageid"))	pageid = page.pageid;
			if(page.hasOwnProperty("title")) 	label = page.title;
			
			
		}
		
		
		/**
		 * get PAge Result form XML
		 */
		public static function getPage(page: Object): PageOwer{
			var ret: PageOwer = new PageOwer();
			ret.parse(page);
			return ret;
		}
		
		
		/**
		 * For Debug 
		 */
		public function toString():String
		{
			var res: String = "";
			res+=label+"("+pageid+"):";
			return res;
		}
	}
}
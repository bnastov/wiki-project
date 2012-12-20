package searchview
{
	import flash.text.ReturnKeyLabel;
	
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.controls.Alert;
	
	/**
	 * Get Result Search from XML results 
	 */
	public class ResultSearch
	{
	
		/**
		 * Array of Pages
		 */ 
		private var pages : ArrayList = new ArrayList();
		public function ResultSearch()
		{
		}
		
		
		/**
		 * Parse from XML
		 */
		public function parse(xmlresults:Object ):void
		{
			pages.removeAll();
			var bienformee : Boolean = false;
			if(xmlresults != null){
			if(xmlresults.hasOwnProperty('api')){
				if(xmlresults.api.hasOwnProperty('query')){
					if(xmlresults.api.query.hasOwnProperty('pages')){
						bienformee= true;
						for each (var e:Object in xmlresults.api.query.pages.page) 
						{
							var inter:PageOwer = PageOwer.getPage(e);
							pages.addItem(inter);
						}
						
					}
				}
			}
			}
			
			if(!bienformee){
				Alert.show("Le Mot que vous cherchez n'exite pas","KO");
			} 
		}
		
		/**
		 * 
		 */
		public function get Pages():ArrayList
		{
			return pages;
		}
		
		
	}
	
	
}
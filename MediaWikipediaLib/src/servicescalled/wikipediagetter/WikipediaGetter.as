/**
 * This is a generated sub-class of _WikipediaGetter.as and is intended for behavior
 * customization.  This class is only generated when there is no file already present
 * at its target location.  Thus custom behavior that you add here will survive regeneration
 * of the super-class. 
 **/
 
package servicescalled.wikipediagetter
{

public class WikipediaGetter extends _Super_WikipediaGetter
{
    /**
     * Override super.init() to provide any initialization customization if needed.
     */
    protected override function preInitializeService():void
    {
        super.preInitializeService();
        // Initialization customization goes here
    }
	
	public function WikipediaGetter(urlServer:String)
	{
		super(urlServer);	
	}
               
}

}

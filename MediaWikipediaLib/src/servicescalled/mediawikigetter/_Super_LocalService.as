/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - LocalService.as.
 */
package servicescalled.mediawikigetter
{
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.services.wrapper.HTTPServiceWrapper;

import mx.rpc.AbstractOperation;
import mx.rpc.AsyncToken;
import mx.rpc.http.HTTPMultiService;
import mx.rpc.http.Operation;


[ExcludeClass]
internal class _Super_LocalService extends com.adobe.fiber.services.wrapper.HTTPServiceWrapper
{

    // Constructor
    public function _Super_LocalService(url:String)
    {
        // initialize service control
        _serviceControl = new mx.rpc.http.HTTPMultiService();
         var operations:Array = new Array();
         var operation:mx.rpc.http.Operation;
         var argsArray:Array;

         operation = new mx.rpc.http.Operation(null, "WikiGetContentPage");
         operation.url = url;
         operation.method = "GET";
         argsArray = new Array("action","prop","titles","rvprop","format");
         operation.argumentNames = argsArray;         
         operation.resultType = Object;
         operations.push(operation);
		 
		 operation = new mx.rpc.http.Operation(null, "WikiLogIn");
		 operation.url = url;
		 operation.method = "POST";
		 argsArray = new Array("action","lgname","lgpassword","lgtoken","format");
		 operation.argumentNames = argsArray;         
		 operation.contentType = "application/x-www-form-urlencoded";
		 operation.resultType = Object;
		 operations.push(operation);
		 
		 operation = new mx.rpc.http.Operation(null, "WikiLogOut");
		 operation.url = url;
		 operation.method = "GET";
		 argsArray = new Array("action");
		 operation.argumentNames = argsArray;         
		 operation.resultType = Object;
		 operations.push(operation);
		 
		 operation = new mx.rpc.http.Operation(null, "WikiGetEditToken");
		 operation.url = url;
		 operation.method = "GET";
		 argsArray = new Array("action","prop","intoken","titles","format");
		 operation.argumentNames = argsArray;         
		 operation.resultType = Object;
		 operations.push(operation);
		 
		 operation = new mx.rpc.http.Operation(null, "WikiEditPage");
		 operation.url = url;
		 operation.method = "POST";
		 argsArray = new Array("action","title","text","token","format");
		 operation.argumentNames = argsArray;         
		 operation.contentType = "application/x-www-form-urlencoded";
		 operation.resultType = Object;
		 operations.push(operation);

         _serviceControl.operationList = operations;  


         preInitializeService();
         model_internal::initialize();
    }
    
    //init initialization routine here, child class to override
    protected function preInitializeService():void
    {
      
    }
    

    /**
      * This method is a generated wrapper used to call the 'getContentPage' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function WikiGetContentPage(action:String, prop:String, titles:String, rvprop:String, format:String) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("WikiGetContentPage");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(action,prop,titles,rvprop,format) ;
        return _internal_token;
    }
	
	/**
	 * This method is a generated wrapper used to call the 'WikiLogIn' operation. It returns an mx.rpc.AsyncToken whose 
	 * result property will be populated with the result of the operation when the server response is received. 
	 * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	 * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
	 *
	 * @see mx.rpc.AsyncToken
	 * @see mx.rpc.CallResponder 
	 *
	 * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	 */
	public function WikiLogIn(action:String, lgname:String, lgpassword:String, lgtoken:String, format:String) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("WikiLogIn");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(action,lgname,lgpassword,lgtoken,format) ;
		return _internal_token;
	}
	
	/**
	 * This method is a generated wrapper used to call the 'WikiLogOut' operation. It returns an mx.rpc.AsyncToken whose 
	 * result property will be populated with the result of the operation when the server response is received. 
	 * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	 * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
	 *
	 * @see mx.rpc.AsyncToken
	 * @see mx.rpc.CallResponder 
	 *
	 * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	 */
	public function WikiLogOut(action:String) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("WikiLogOut");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(action) ;
		return _internal_token;
	}
	
	/**
	 * This method is a generated wrapper used to call the 'WikiEditToken' operation. It returns an mx.rpc.AsyncToken whose 
	 * result property will be populated with the result of the operation when the server response is received. 
	 * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	 * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
	 *
	 * @see mx.rpc.AsyncToken
	 * @see mx.rpc.CallResponder 
	 *
	 * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	 */
	public function WikiGetEditToken(action:String, prop:String, intoken:String, titles:String, format:String) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("WikiGetEditToken");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(action,prop,intoken,titles,format) ;
		return _internal_token;
	}
	
	
	
	/**
	 * This method is a generated wrapper used to call the 'Operation2' operation. It returns an mx.rpc.AsyncToken whose 
	 * result property will be populated with the result of the operation when the server response is received. 
	 * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
	 * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
	 *
	 * @see mx.rpc.AsyncToken
	 * @see mx.rpc.CallResponder 
	 *
	 * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
	 */
	public function WikiEditPage(action:String, title:String, text:String, token:String, format:String) : mx.rpc.AsyncToken
	{
		var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("WikiEditPage");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(action,title,text,token,format) ;
		return _internal_token;
	}
     
}

}

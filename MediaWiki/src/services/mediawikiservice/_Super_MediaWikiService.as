/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - MediaWikiService.as.
 */
package services.mediawikiservice
{
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.services.wrapper.HTTPServiceWrapper;
import mx.rpc.AbstractOperation;
import mx.rpc.AsyncToken;
import mx.rpc.http.HTTPMultiService;
import mx.rpc.http.Operation;


[ExcludeClass]
internal class _Super_MediaWikiService extends com.adobe.fiber.services.wrapper.HTTPServiceWrapper
{

    // Constructor
    public function _Super_MediaWikiService()
    {
        // initialize service control
        _serviceControl = new mx.rpc.http.HTTPMultiService("");
         var operations:Array = new Array();
         var operation:mx.rpc.http.Operation;
         var argsArray:Array;

         operation = new mx.rpc.http.Operation(null, "WikiLogIn");
         operation.url = "http://127.0.0.1:8887/mediawiki-1.20.0/api.php";
         operation.method = "POST";
         argsArray = new Array("action","lgname","lgpassword","lgtoken","format");
         operation.argumentNames = argsArray;         
         operation.contentType = "application/x-www-form-urlencoded";
         operation.resultType = Object;
         operations.push(operation);

         operation = new mx.rpc.http.Operation(null, "WikiLogOut");
         operation.url = "http://127.0.0.1:8887/mediawiki-1.20.0/api.php";
         operation.method = "GET";
         argsArray = new Array("action");
         operation.argumentNames = argsArray;         
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
     
}

}

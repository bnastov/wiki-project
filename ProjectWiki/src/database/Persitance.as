package database
{
	import flash.data.SQLConnection;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.errors.SQLError;
	import flash.events.SQLErrorEvent;
	import flash.events.SQLEvent;
	import flash.filesystem.File;
	import flash.text.ReturnKeyLabel;
	
	import mx.controls.Alert;

	public class Persitance
	{
		public var conn:SQLConnection; 
		private var nameDb : String;
		public function Persitance(name:String)
		{
			conn = new SQLConnection();
			nameDb = name;
		}
		
		public function open(createtable:Boolean = false):Boolean{
			
			// The database file is in the application storage directory 
			var folder:File = File.applicationStorageDirectory; 
			var dbFile:File = folder.resolvePath(nameDb); 
			
			var ret: Boolean;
			try 
			{ 
				conn.open(dbFile); 
				if(createtable)	createTables();
				ret =  true;
			}
			catch (error:SQLError) 
			{ 
				Alert.show(error.details, error.message); 
				ret = false;	
			} 
			
			return ret;
		}
		
		public  function openAsycrone():void{
			
			conn.addEventListener(SQLEvent.OPEN, createHandler); 
			conn.addEventListener(SQLErrorEvent.ERROR, errorHandler); 
			
			// The database file is in the application storage directory 
			var folder:File = File.applicationStorageDirectory; 
			trace(folder.nativePath);
			var dbFile:File = folder.resolvePath(nameDb); 
			
			conn.openAsync(dbFile); 
		}
		
		private function createHandler(event:SQLEvent):void 
		{ 
			trace("the database was created successfully");
			createTables();
		} 
		
		private function errorHandler(event:SQLErrorEvent):void 
		{ 
			Alert.show(event.error.details,event.error.message); 
		}
	
		
		public  function insertUser(token: String, name :String, notexist:Boolean = true):void
		{
			var exist :Boolean = false;
			if(notexist){
				var stm :SQLStatement = new SQLStatement;
				exeSyncrone(stm,"Select token FROM user WHERE token = '"+token+"'");
				if(stm.getResult().data!=null){
					exist = true;
					trace("The User exist deja");
				}
			} 
			
			if(!exist){
				var req:String ="";
				req += "INSERT INTO user (token, name) ";
				req += "VALUES ('"+token+"', '"+name+"')";
				exec(req,donothing);
			}
			
		}
		
		public  function insertPage(namepage :String,iduser: String ):void
		{
			var date : String = new Date().toString();
			var req:String ="";
			req += "INSERT INTO pagehistory (idpage, namepage, date, iduser) ";
			req += "VALUES (NULL,'"+namepage+"', '"+date+"','"+iduser+"')";
			exec(req,donothing);
		}
		
		
		private function donothing(event:SQLEvent):void 
		{ 
			trace("Statment excuted successful"); 
		}
		
		private function createTables():void
		{
			var req:String =  
				"CREATE TABLE IF NOT EXISTS user (" +  
				"    token TEXT PRIMARY KEY , " +  
				"    name TEXT " +  
				")"; 
			exec(req,createResult);
			
			var req1:String =  
				"CREATE TABLE IF NOT EXISTS pagehistory (" +  
				"    idpage INTEGER PRIMARY KEY AUTOINCREMENT, " +  
				"    namepage TEXT, " +
				"    date TEXT, " +
				"    iduser TEXT, " +
				"  FOREIGN KEY(iduser) REFERENCES user(token) "+
				")";
			exec(req1,createpagehistory);
			
			var req2:String =  
				"CREATE TABLE IF NOT EXISTS server (" +
				"    idurl INTEGER, " +  
				"    api TEXT, " +
				"    get TEXT " +
				")";
			exec(req2,createServer);
		} 
		
		private function createpagehistory(event:SQLEvent):void 
		{ 
			trace("Table pagehistory created"); 
		} 
		private function createResult(event:SQLEvent):void 
		{ 
			trace("Table user created"); 
		} 
		
		private function createServer(event:SQLEvent):void 
		{ 
			trace("Table server created");
			var lx : SQLStatement = new SQLStatement();
			exeSyncrone(lx,"INSERT INTO server (idurl,api, get) VALUES ('1','http://127.0.0.1/wiki/api.php','http://127.0.0.1/wiki/index.php')");
		} 
		
		public function updateServer(url:String):void{
			var lx : SQLStatement = new SQLStatement();
			exeSyncrone(lx,"UPDATE server set (api = '"+url+"api.php',get ='"+url+"index.php')");
		}
	
		
		 
		public function execWithStatement(stmt : SQLStatement, req : String, callback : *): void{
			stmt.sqlConnection = conn;
			stmt.text = req;
			
			stmt.addEventListener(SQLEvent.RESULT, callback);
			stmt.addEventListener(SQLErrorEvent.ERROR, errorHandler);
			
			stmt.execute();
		}
		
		public function exec(req : String, callback : *): void{
			var insertStmt:SQLStatement;
			insertStmt = new  SQLStatement();
			execWithStatement(insertStmt,req,callback);
			
			trace(req);
		}
		
		public  function exeSyncrone(stmt : SQLStatement, req : String):void
		{
			stmt.sqlConnection = conn;
			stmt.text = req;
			try{	
				stmt.execute();
			} catch ( err : SQLError){
				Alert.show("Error in excution of statement :"+req);
			}
		}
		
		public  function clearDatabase():void
		{
			var req:String = " DELETE FROM user";
			var st:SQLStatement = new SQLStatement();
			exeSyncrone(st,req);
			
			var req1:String = " DELETE FROM pagehistory";
			exeSyncrone(st,req1);
			
			trace("Cleared OK");
		}
	}
}
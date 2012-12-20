package searchview
{
	public class EndPoint
	{
		public var index:Number;
		public var value:String;
		public var label:String;
		public function EndPoint()
		{
		}
		
		public function toString():String
		{
			return label+"("+value+")";
		}
	}
}
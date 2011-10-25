package com.yuco.utils
{
	import flash.events.EventDispatcher;
	import flash.external.ExtensionContext;
	import flash.events.StatusEvent;
	import flash.events.Event;
	
	public class UDPExtension extends EventDispatcher
	{
		private var context:ExtensionContext;
		public var StatusCode:String;
		public var ErrorCode:String;
		public var ErrorMessage:String;
		public var ReceivedText:String;
		
		public function UDPExtension()
		{
			context = ExtensionContext.createExtensionContext('com.yuco.utils.UDPExtension', '');
			context.addEventListener(StatusEvent.STATUS, onStatus);
			ReceivedText = "";
		}
		
		public function Connect(_address:String, _port:int):void
		{
			var result:int;
			context.call('ConnectServer', _address, _port);
			return;
		}
		
		public function Send(_mess:String):void
		{
			var result:int;
			context.call('Send', _mess);
			return;
		}
		
		private function onStatus(e:StatusEvent):void {
			if (e.level == "status") {
				StatusCode = e.code; 
				dispatchEvent(new Event ("StatusCode"));
				if(e.code == "received"){
					ReceivedText = context.call('GetReceived') as String;
					dispatchEvent (new Event ("Received") );
				}
            }else if (e.level == "error") {
				ErrorCode = e.code;
				dispatchEvent(new Event ("ErrorCode"));
				ErrorMessage = context.call('LastMessage') as String;
				dispatchEvent(new Event ("ErrorMessage"));
			}
		}
	}
}
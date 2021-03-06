package demo {
	import com.mobilo.time.Interval;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	/**
	 * @author jonas
	 * @date 16 juin 2011
	 */
	[SWF(width="320", height="480", frameRate="60", backgroundColor="#f2f2f2")]
	public class IntervalDemo extends Sprite
	{
		private var message1:TextField;
		private var message2:TextField;
		private var start1:int;
		private var start2:int;

		public var iteration:int = 30;
		public var delay:int = 100;

		public function IntervalDemo()
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			message1 = new TextField();
			message1.width = 160;
			message1.height = 480;
			message1.mouseEnabled = false;
			message1.text = "Timer() :\ntap to start";
			addChild(message1);

			message2 = new TextField();
			message2.x = 160;
			message2.width = 160;
			message2.height = 480;
			message2.mouseEnabled = false;
			message2.text = "Interval.create() :\ntap to start";
			addChild(message2);

			stage.addEventListener(MouseEvent.CLICK, start);
		}

		private function start(event : MouseEvent) : void
		{
			event.stopImmediatePropagation();

			if(event.stageX<=160){
				message1.htmlText = "Timer()\n";
				startTest1();
			}else{
				message2.htmlText = "Interval.create()\n";
				startTest2();
			}
		}

		public function startTest1():void {
			start1 = getTimer();
			var timer:Timer = new Timer(delay, iteration);
			timer.addEventListener(TimerEvent.TIMER, test1);
			timer.start();
		}

		public function startTest2():void {
			start2 = getTimer();
			Interval.create(test2, delay, iteration);
		}

		public function test1(event:TimerEvent):void {
			event.stopImmediatePropagation();
			var m:String = (getTimer()-start1)+"\n";
			message1.appendText(m);
		}

		public function test2():void {
			var m:String = (getTimer()-start2)+"\n";
			message2.appendText(m);
		}
	}
}

package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	[SWF(width = "600", height = "400")]
	
	/**
	 * ...
	 * @author Alex Larioza
	 */
	public class Main extends Engine
	{
		
		public function Main()
		{
			super(600, 400, 30);
			
			FP.screen.color = 0xffffff;
			FP.console.enable();
		}
		
		override public function init():void
		{
			super.init();
			
			FP.world = new GameWorld;
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}
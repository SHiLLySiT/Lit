package  
{
	import lit.Light;
	import lit.Lighting;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author alex larioza
	 */
	public class GameWorld extends World 
	{
		[Embed(source = "../assets/circle.png")] public static const SPR_LIGHT_CIRCLE:Class;
		[Embed(source = "../assets/circle_gradient.png")] public static const SPR_LIGHT_CIRCLE_GRADIENT:Class;
		[Embed(source = "../assets/square.png")] public static const SPR_LIGHT_SQUARE:Class;
		[Embed(source = "../assets/dirt.png")] public static const SPR_BG:Class;
		
		public var lighting:Lighting;
		public var mouseLight:Light;
		
		public function GameWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			super.begin();
			
			// background image
			var bg:Backdrop = new Backdrop(SPR_BG);
			this.addGraphic(bg, 1000);
			
			// create new lighting
			add(lighting = new Lighting(FP.screen.width, FP.screen.height));
			
			// add lights
			for (var i:uint = 0; i < 50; i++)
			{
				var image:Image = new Image(FP.choose(SPR_LIGHT_SQUARE, SPR_LIGHT_CIRCLE, SPR_LIGHT_CIRCLE_GRADIENT));
				image.centerOO();
				lighting.add(new Light(FP.rand(FP.screen.width), FP.rand(FP.screen.height), image, Math.random() * 1.5 + 0.5, Math.random(), Math.random() * 100 * FP.elapsed));
			}
			
			// add light that follows mouse
			image = new Image(SPR_LIGHT_CIRCLE);
			image.centerOO();
			mouseLight = new Light(0, 0, image, 4, 0.8);
			lighting.add(mouseLight);
		}
		
		override public function update():void 
		{
			super.update();
			
			mouseLight.x = mouseX;
			mouseLight.y = mouseY;
			
			if (Input.pressed(Key.R))
			{
				FP.world = new GameWorld()
			}
			
			if (Input.check(Key.D))
			{
				camera.x += 100 * FP.elapsed;
			}
			if (Input.check(Key.A))
			{
				camera.x -= 100 * FP.elapsed;
			}
			if (Input.check(Key.S))
			{
				camera.y += 100 * FP.elapsed;
			}
			if (Input.check(Key.W))
			{
				camera.y -= 100 * FP.elapsed;
			}
		}
		
	}

}

package Game
{
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class AnimatedButton extends Button
	{
		private var timer : Number,
					image : Image;
		
		public function AnimatedButton(x:Number, y:Number, width:Number, height:Number, image : Image, action:Function)
		{
			super(x, y, width, height, image, action);
			this.image = image;
		}
		
		override public function MouseIn():void
		{
			timer = 0;
		}
		
		override public function update() : void
		{
			super.update();

			timer += FP.elapsed;
			if (Hovering)
				image.alpha = Math.cos(timer * 4) / 2 + .5;
			else
				image.alpha = 1;
		}
	}
}

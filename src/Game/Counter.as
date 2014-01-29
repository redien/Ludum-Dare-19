package Game
{
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	
	public class Counter extends Entity
	{
		private var number_images : Array = [];
		
		private var count : int;
		
		public function get Count() : int
		{
			return count;
		}
		
		public function set Count(count : int) : void
		{
			graphic = number_images[count] 
			this.count = count;
		}
		
		public function Counter(x:Number=0, y:Number=0)
		{
			super(x, y);
			
			number_images.push(new Image(Images.NUMBER_FONT, new Rectangle(0, 0, 20, 20)));
			number_images.push(new Image(Images.NUMBER_FONT, new Rectangle(20, 0, 20, 20)));
			number_images.push(new Image(Images.NUMBER_FONT, new Rectangle(40, 0, 20, 20)));
			number_images.push(new Image(Images.NUMBER_FONT, new Rectangle(60, 0, 20, 20)));
			number_images.push(new Image(Images.NUMBER_FONT, new Rectangle(80, 0, 20, 20)));
			number_images.push(new Image(Images.NUMBER_FONT, new Rectangle(100, 0, 20, 20)));
			number_images.push(new Image(Images.NUMBER_FONT, new Rectangle(120, 0, 20, 20)));
			number_images.push(new Image(Images.NUMBER_FONT, new Rectangle(140, 0, 20, 20)));
			number_images.push(new Image(Images.NUMBER_FONT, new Rectangle(160, 0, 20, 20)));
			number_images.push(new Image(Images.NUMBER_FONT, new Rectangle(180, 0, 20, 20)));
			Count = 0;
		}
	}
}
package Game
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	public class Block extends Entity
	{
		private var mx : Number, my : Number,
					sfx : Sfx,
					reached : Boolean,
					timer : Number,
					image : Image;
		
		private var selected : Boolean;
		
		public function set Selected(state : Boolean) : void
		{
			selected = state;
			timer = 0;
		}
		
		public function get Selected() : Boolean
		{
			return selected;
		}
		
		public function Block(x:Number=0, y:Number=0, width : int = 8, height : int = 8, image:Image=null)
		{
			if (!image)
				image = new Image(Images.PIXEL);
			
			super(x, y, image);
			this.width = width;
			this.height = height;
			mx = x;
			my = y;
			reached = true;
			
			sfx = new Sfx(Audio.PING);
			
			timer = 0;
			this.image = image;
			Selected = false;
		}
		
		private function Move(elapsed : Number) : void
		{
			var dx : Number = mx - x,
				dy : Number = my - y;
			
			var d : Number = Math.sqrt(dx*dx + dy*dy);
			
			if (d >= 1)
			{
				x += dx / d * 200 * elapsed;
				y += dy / d * 200 * elapsed;
			}
			else
			{
				x = mx;
				y = my;
				
				if (!reached)
				{
					//sfx.play();
					reached = true;
				}
			}
		}
		
		public function MoveTo(x : Number, y : Number) : void
		{
			mx = x;
			my = y;
			reached = false;
		}
		
		override public function update() : void
		{
			super.update();
			Move(FP.elapsed);
			
			timer += FP.elapsed;
			if (Selected)
				image.alpha = Math.cos(timer * 4) / 2 + .5;
			else
				image.alpha = 1;
		}
	}
}

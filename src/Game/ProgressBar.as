package Game
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class ProgressBar extends Entity
	{
		private var list : Graphiclist,
					bar : Image,
					timer : Number;
		
		public function ProgressBar(x:Number=0, y:Number=0)
		{
			list = new Graphiclist(new Image(Images.PROGRESS_CONTAINER));
			bar = new Image(Images.PROGRESS_BAR);
			bar.x = 2;
			bar.y = 2;
			list.add(bar);
			timer = 0;
			super(x, y, list);
		}
		
		public function set Progress(progress : Number) : void
		{
			bar.scaleX = progress;
		}
		
		override public function update() : void
		{
			super.update();
			timer += FP.elapsed;
			bar.alpha = Math.sin(timer * 2) / 2 + .5; 
		}
	}
}
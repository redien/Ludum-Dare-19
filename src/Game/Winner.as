
package Game
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	public class Winner extends World
	{
		public function Winner()
		{
			super();
			
			add(new Entity(0, 0, new Image(Images.WINNER)));
		}
	}
}

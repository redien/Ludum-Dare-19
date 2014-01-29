
package Game
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	public class NextLevel extends World
	{
		private var grid : PlayingGrid,
					next_level : int,
					timer : Number = 0;

		public function NextLevel(grid : PlayingGrid, level : int, progress_bar : ProgressBar)
		{
			super();
			
			next_level = level + 1;
			
			this.grid = grid;
			add(grid);
			add(progress_bar);
			add(new Entity(0, 0, new Image(Images.WIN)));
		}
		
		override public function update() : void
		{
			super.update();
			
			timer += FP.elapsed;
			if (timer >= 3)
			{
				if (next_level < Levels.grids.length)
				{
					if (next_level % 9 == 0)
						FP.world = new LevelHint(next_level);
					else
						FP.world = new Gameplay(next_level);
				}
				else
				{
					FP.world = new Winner();
				}
			}
		}
	}
}

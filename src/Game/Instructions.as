
package Game
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class Instructions extends World
	{
		private var menu : World,
					grid : PlayingGrid,
					state : int,
					timer : Number;

		public function Instructions()
		{
			this.menu = FP.world;
			add(new Entity(0, 0, new Image(Images.INSTRUCTIONS)));
			grid = new PlayingGrid(112, 100, Levels.grids[0].width, Levels.grids[0].height);
			grid.Initialize(Levels.grids[0].start);
			add(grid);
			state = 0;
			timer = 0;
		}

		override public function update() : void
		{
			super.update();
			
			timer += FP.elapsed;
			if (timer >= 2)
			{
				timer = 0;
				state++;
				
				if (state == 1)
					grid.GetBlock(1, 3).Selected = true;
				
				if (state == 2)
					grid.Move(1, 3, 0, 3);
				
				if (state == 3)
					grid.GetBlock(0, 3).Selected = false;
				
				if (state == 4)
					grid.Initialize(Levels.grids[0].start);
				
				if (state == 5)
					state = 0;
			}
			
			if (net.flashpunk.utils.Input.mousePressed)
				FP.world = menu; 
		}
	}
}

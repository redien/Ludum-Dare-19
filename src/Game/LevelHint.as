package Game
{
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	
	public class LevelHint extends World
	{
		private var grids : Array = [],
					timer : Number,
					level : int,
					start_level : int,
					hint_sfx : Sfx,
					destination : int;

		public function LevelHint(start_level : int)
		{
			var i : int;
			super();

			destination = start_level + 9;
			if (destination > Levels.grids.length)
				destination = Levels.grids.length;

			for (i = start_level; i < destination; ++i)
			{
				var level : Object = Levels.grids[i];
				var grid : PlayingGrid = new PlayingGrid(
					160 - level.width * 12,
					140 - level.height * 12,
					level.width,
					level.height);
				grid.Initialize(level.solution);
				
				grids.push(grid);
			}
			
			timer = 0;
			this.level = 0;
			this.start_level = start_level;
			add(grids[this.level]);
			
			hint_sfx = new Sfx(Audio.HINT);
		}
		
		override public function update():void
		{
			super.update();
			
			timer += FP.elapsed;
			if (timer >= 0.2)
			{
				level++;
				timer = 0;
				hint_sfx.play();

				if (level >= destination - start_level)
				{
					FP.world = new Gameplay(start_level);
				}
				else
				{
					if (level < destination - start_level)
					{
						remove(grids[level - 1]);
						add(grids[level]);
					}
				}
			}
		}
	}
}

package Game
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	public class Gameplay extends World
	{
		private var grid : PlayingGrid,
					selector : Entity,
					selected_x : int,
					selected_y : int,
					selectable_up : Entity,
					selectable_down : Entity,
					selectable_left : Entity,
					selectable_right : Entity,
					selected_cell : Boolean,
					solution_grid : Array,
					moves : Counter,
					level : int,
					button_retry : Button,
					progress_bar : ProgressBar,
					retry_timer : Number,
					error_sfx : Sfx,
					start_count : int;

		public function Gameplay(level : int)
		{
			super();

			this.level = level;
			
			grid = new PlayingGrid(
				160 - Levels.grids[level].width * 12,
				140 - Levels.grids[level].height * 12,
				Levels.grids[level].width,
				Levels.grids[level].height);
			add(grid);
			ResetGrid();

			selected_cell = false;

			selected_x = 0;
			selected_y = 0;
			selector = new Entity(selected_x * 24 + grid.x, selected_y * 24 + grid.y, new Image(Images.SELECTOR));
			selector.visible = false;
			add(selector);
			
			var selectable_image : Image = new Image(Images.SELECTABLE);
			selectable_image.alpha = 0.5;
			selectable_up = new Entity(0, 0, selectable_image);
			selectable_down = new Entity(0, 0, selectable_image);
			selectable_left = new Entity(0, 0, selectable_image);
			selectable_right = new Entity(0, 0, selectable_image);
			add(selectable_up);
			add(selectable_down);
			add(selectable_left);
			add(selectable_right);
			SetSelectable();
			
			start_count = Levels.grids[level].moves;
			moves = new Counter(10, 10);
			moves.Count = Levels.grids[level].moves;
			add(moves);
			
			button_retry = new AnimatedButton(200, 10, 140, 20, new Image(Images.BUTTON_RETRY), Retry);
			button_retry.Enabled = false;
			add(button_retry);
			
			progress_bar = new ProgressBar(60, 260);
			add(progress_bar);
			UpdateProgress();
			
			retry_timer = 0;
			
			error_sfx = new Sfx(Audio.ERROR);
		}
		
		private function Retry() : void
		{
			ResetGrid();
			moves.Count = Levels.grids[level].moves;
			grid.GetBlock(selected_x, selected_y).Selected = false;
			selected_cell = false;
			selector.visible = false;
			SetSelectable();
			UpdateProgress();
		}
		
		private function UpdateProgress() : void
		{
			progress_bar.Progress = grid.MatchRatioDifference(Levels.grids[level].solution, Levels.grids[level].start);
		}

		private function ResetGrid() : void
		{
			grid.Initialize(Levels.grids[level].start);
		}
		
		private function SetSelectable() : void
		{
			if (selected_cell)
			{
				selectable_up.visible = grid.IsSelectable(selected_x, selected_y - 1);
				selectable_down.visible = grid.IsSelectable(selected_x, selected_y + 1);
				selectable_left.visible = grid.IsSelectable(selected_x - 1, selected_y);
				selectable_right.visible = grid.IsSelectable(selected_x + 1, selected_y);
				selectable_up.x = selector.x;
				selectable_up.y = selector.y - 24;
				selectable_down.x = selector.x;
				selectable_down.y = selector.y + 24;
				selectable_left.x = selector.x - 24;
				selectable_left.y = selector.y;
				selectable_right.x = selector.x + 24;
				selectable_right.y = selector.y;
			}
			else
			{
				selectable_up.visible = false;
				selectable_down.visible = false;
				selectable_left.visible = false;
				selectable_right.visible = false;
			}
		}
		
		private function SetSelected(x : int, y : int) : Boolean
		{
			if (x >= 0 && x < grid.Columns && y >= 0 && y < grid.Rows)
			{
				if (grid.GetCell(x, y))
				{
					if (selected_cell)
						grid.GetBlock(selected_x, selected_y).Selected = false;
					
					grid.GetBlock(x, y).Selected = true;

					selected_x = x;
					selected_y = y;
					selector.x = grid.x + selected_x * 24;
					selector.y = grid.y + selected_y * 24;
					selected_cell = true;
					selector.visible = true;
					
					SetSelectable();
					
					return true;
				}
			}
			
			return false;
		}
		
		override public function update() : void
		{
			super.update();

			retry_timer += FP.elapsed;
			if (retry_timer >= 1 && moves.Count == 0)
			{
				Retry();
			}
			
			button_retry.Enabled = (moves.Count != start_count);	

			if (Input.mousePressed && moves.Count > 0)
			{
				var sx : int = (Input.mouseX - grid.x) / 24,
					sy : int = (Input.mouseY - grid.y) / 24;
				if (!SetSelected(sx, sy))
				{
					if (selected_cell && grid.IsSelectable(sx, sy))
					{
						var d : int = Math.abs(sx - selected_x) + Math.abs(sy - selected_y);
						if (d == 1 && moves.Count > 0)
						{
							grid.GetBlock(selected_x, selected_y).Selected = false;
							grid.Move(selected_x, selected_y, sx, sy);
							selected_cell = false;
							selector.visible = false;
							SetSelectable();
							moves.Count--;
							UpdateProgress();

							if (grid.Matches(Levels.grids[level].solution))
							{
								remove(grid);
								remove(progress_bar);
								FP.world = new NextLevel(grid, level, progress_bar);
							}
							else if (moves.Count == 0)
							{
								error_sfx.play();
								retry_timer = 0;
							}
						}
					}
				}
			}
		}
	}
}

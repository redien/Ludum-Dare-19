package Game
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	
	public class PlayingGrid extends Entity
	{
		private var blocks : Array = [],
					grid : Array = [],
					columns : int,
					rows : int;

		public function PlayingGrid(x:Number=0, y:Number=0, columns : int = 5, rows : int = 5)
		{
			this.columns = columns;
			this.rows = rows;

			super(x, y);

			for (y = 0; y < rows; ++y)
			{
				for (x = 0; x < columns; ++x)
				{
					blocks[y * columns + x] = new Block(x * 24, y * 24, 24, 24, new Image(Images.SQUARE));
					blocks[y * columns + x].visible = false;
				}
			}

			InitializeGrid();
		}
		
		public function get Columns() : int
		{
			return columns;
		}
		
		public function get Rows() : int
		{
			return rows;
		}
		
		private function InitializeGrid() : void
		{
			var x : int, y : int;
			for (y = 0; y < rows; ++y)
			{
				for (x = 0; x < columns; ++x)
				{
					SetCell(x, y, false);
				}
			}
		}
		
		public function SetCell(x : int, y : int, new_state : Boolean) : void
		{
			var state : Boolean = grid[y * columns + x];
			grid[y * columns + x] = new_state;
			
			blocks[y * columns + x].visible = new_state;
		}
		
		public function GetCell(x : int, y : int) : Boolean
		{
			return grid[y * columns + x];
		}
		
		public function GetBlock(x : int, y : int) : Block
		{
			return blocks[y * columns + x];
		}
		
		public function Move(x : int, y : int, x2 : int, y2 : int) : void
		{
			var block : Block = blocks[y * columns + x];
			blocks[y * columns + x] = blocks[y2 * columns + x2];
			blocks[y2 * columns + x2] = block;

			blocks[y * columns + x].MoveTo(x * 24, y * 24);
			blocks[y2 * columns + x2].MoveTo(x2 * 24, y2 * 24);
			grid[y * columns + x] = false;
			grid[y2 * columns + x2] = true;
		}
		
		public function IsSelectable(x : int, y : int) : Boolean
		{
			if (x < 0 || x >= columns || y < 0 || y >= rows)
				return false;
			
			if (GetCell(x, y))
				return false;
			else
				return true;
		}
		
		public function Matches(array : Array) : Boolean
		{
			var x : int, y : int;
			for (y = 0; y < rows; ++y)
			{
				for (x = 0; x < columns; ++x)
				{
					if (array[y * columns + x] != grid[y * columns + x])
						return false;
				}
			}
			
			return true;
		}
		
		public function Initialize(array : Array) : void
		{
			InitializeGrid();

			var x : int, y : int;
			for (y = 0; y < rows; ++y)
			{
				for (x = 0; x < columns; ++x)
				{
					SetCell(x, y, array[y * columns + x]);
				}
			}
		}
		
		public function MatchCount(a : Array, b : Array) : Number
		{
			var x : int, y : int, matches : int = 0;
			for (y = 0; y < rows; ++y)
			{
				for (x = 0; x < columns; ++x)
				{
					if (a[y * columns + x] == b[y * columns + x])
						matches++;
				}
			}
			
			return matches;
		}
		
		public function MatchRatio(array : Array) : Number
		{
			return MatchCount(grid, array) / (rows * columns);
		}

		public function MatchRatioDifference(solution : Array, initial : Array) : Number
		{
			var ratio : Number = (MatchCount(grid, solution) - MatchCount(initial, solution)) / ((rows * columns) - MatchCount(initial, solution));
			if (ratio > 0)
				return ratio;
			else
				return 0;
		}
		
		override public function render():void
		{
			super.render();
			
			var i : int;
			for (i = 0; i < blocks.length; ++i)
			{
				if (blocks[i].visible)
				{
					blocks[i].x += x;
					blocks[i].y += y;
					blocks[i].render();
					blocks[i].x -= x;
					blocks[i].y -= y;
				}
			}
		}
		
		override public function update():void
		{
			super.update();
			
			var i : int;
			for (i = 0; i < blocks.length; ++i)
				blocks[i].update();
		}
	}
}


package Game
{
	import net.flashpunk.Graphic;
	
	public class BlockButton extends Button
	{
		private var blocks : Array = [];

		public function BlockButton(x:Number, y:Number,
									array : Array,
									columns : int, rows : int,
									block_width : int, block_height : int,
									action:Function)
		{
			super(x, y, columns * block_width, rows * block_height, null, action);

			var y2 : int, x2 : int;
			for (y2 = 0; y2 < rows; ++y2)
			{
				for (x2 = 0; x2 < columns; ++x2)
				{
					if (array[y2 * columns + x2] == 1)
					{
						var block : Block = new Block(320, y + y2 * block_height);
						block.MoveTo(x + x2 * block_width, y + y2 * block_height);
						blocks.push(block);
					}
				}
			}
		}
		
		override public function MouseIn() : void
		{
			var i : int;
			for (i = 0; i < blocks.length; ++i)
			{
				blocks[i].Selected = true;
			}
		}
		
		override public function MouseOut() : void
		{
			var i : int;
			for (i = 0; i < blocks.length; ++i)
			{
				blocks[i].Selected = false;
			}
		}
		
		override public function update():void
		{
			super.update();
			var i : int;
			for (i = 0; i < blocks.length; ++i)
			{
				blocks[i].update();
			}
		}
		
		override public function render():void
		{
			super.render();
			var i : int;
			for (i = 0; i < blocks.length; ++i)
			{
				blocks[i].render();
			}
		}
	}
}

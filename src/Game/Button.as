
package Game
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	
	public class Button extends Entity
	{
		private var action : Function,
					enabled : Boolean,
					hovering : Boolean = false;

		public function Button(x:Number, y:Number, width : Number, height : Number, graphic:Graphic, action : Function)
		{
			super(x, y, graphic);
			this.width = width;
			this.height = height;
			this.action = action;
			enabled = true;
		}
		
		public function get Hovering() : Boolean
		{
			return hovering;
		}
		
		public function MouseIn() : void
		{
		}
		
		public function MouseOut() : void
		{
		}
		
		override public function update() : void
		{
			super.update();
			
			if (Input.mouseX >= x && Input.mouseX < x + width
				&& Input.mouseY >= y && Input.mouseY < y + height)
			{
				if (enabled && Input.mousePressed)
					action();

				if (!hovering)
					MouseIn();
				hovering = true;
			}
			else
			{
				if (hovering)
					MouseOut();
				hovering = false;
			}
		}

		public function set Enabled(state : Boolean) : void
		{
			visible = state;
			enabled = state;
		}
	}
}

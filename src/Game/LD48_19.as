
package Game
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;

	public class LD48_19 extends Engine
	{
		public function LD48_19()
		{
			//FP.world = new LevelHint(0);
			FP.world = new MainMenu();
			super(320, 280);
		}
	}
}

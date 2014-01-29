
package Game
{
	public class Levels
	{
		public static const grids : Array = [
			{
				width: 3,
				height: 4,
				start: [
					true, true, true,
					true, false, true,
					false, true, false,
					false, true, true,
				],
				solution: [
					true, true, true,
					true, false, true,
					false, true, false,
					true, false, true,
				],
				moves: 1
			},
			{
				width: 5,
				height: 4,
				start: [
					true, true, true, true, true,
					true, true, false, false, true,
					true, true, true, true, true,
					true, true, false, true, true,
				],
				solution: [
					true, true, true, true, true,
					true, false, true, false, true,
					true, true, true, true, true,
					true, true, false, true, true,
				],
				moves: 1
			},
			{
				width: 5,
				height: 4,
				start: [
					false, true, true, false, false,
					true, true, false, true, true,
					false, true, true, true, false,
					false, true, false, true, false,
				],
				solution: [
					false, true, true, true, false,
					true, false, true, false, true,
					false, true, true, true, false,
					false, true, false, true, false,
				],
				moves: 2
			},
			{
				width: 5,
				height: 4,
				start: [
					false, false, true, false, true,
					true, true, true, false, true,
					false, true, true, false, true,
					true, false, false, false, true,
				],
				solution: [
					false, true, true, true, false,
					true, false, true, false, true,
					false, true, true, true, false,
					true, false, false, false, true,
				],
				moves: 3
			},
			{
				width: 5,
				height: 5,
				start: [
					false, true, true, false, false,
					true, true, false, true, true,
					true, true, true, true, true,
					true, true, true, true, false,
					false, false, false, false, true,
				],
				solution: [
					false, true, true, true, false,
					true, false, true, false, true,
					true, true, true, true, true,
					false, true, true, true, false,
					true, false, false, false, true,
				],
				moves: 3
			},
			{
				width: 5,
				height: 5,
				start: [
					true, true, true, true, true,
					true, false, true, false, true,
					true, true, true, true, false,
					true, false, true, false, true,
					true, false, true, false, true,
				],
				solution: [
					true, true, true, true, true,
					true, false, true, false, true,
					false, true, true, true, false,
					true, true, true, true, true,
					true, false, false, false, true,
				],
				moves: 4
			},
			{
				width: 7,
				height: 4,
				start: [
					false, false, false, false, false, false, false,
					false, false, true, true, true, false, false,
					true, true, true, true, true, true, true,
					false, true, false, true, true, true, false,
				],
				solution: [
					false, false, false, true, false, false, false,
					false, false, true, true, true, false, false,
					false, true, false, true, false, true, false,
					true, true, true, true, true, true, true,
				],
				moves: 6
			},
			{
				width: 5,
				height: 5,
				start: [
					false, true, true, true, true,
					true, false, true, false, true,
					false, true, true, true, false,
					true, true, false, true, false,
					false, true, false, true, true,
				],
				solution: [
					false, true, true, true, false,
					true, true, false, true, true,
					false, true, true, true, false,
					false, true, false, true, false,
					true, true, false, true, true,
				],
				moves: 4
			},
			{
				width: 5,
				height: 5,
				start: [
					false, true, true, true, false,
					false, true, true, true, true,
					true, true, true, true, false,
					true, true, true, false, true,
					false, true, true, true, false,
				],
				solution: [
					false, true, true, true, false,
					true, false, true, false, true,
					true, true, true, true, true,
					true, true, false, true, true,
					true, false, true, false, true,
				],
				moves: 6
			},

			
			
			
			{
				width: 5,
				height: 4,
				start: [
					false, true, true, true, false,
					true, false, true, true, true,
					true, true, true, false, true,
					true, true, true, true, false,
				],
				solution: [
					false, true, true, true, false,
					true, true, false, true, true,
					true, true, true, true, true,
					true, false, true, false, true,
				],
				moves: 5
			},
			{
				width: 5,
				height: 4,
				start: [
					false, true, false, true, false,
					false, true, true, true, true,
					true, true, true, true, false,
					true, false, true, false, true,
				],
				solution: [
					true, true, true, true, true,
					false, true, false, true, false,
					false, true, true, true, false,
					true, false, true, false, true,
				],
				moves: 4
			},
			{
				width: 5,
				height: 7,
				start: [
					false, true, false, false, true,
					false, true, false, true, true,
					false, true, true, true, false,
					true, true, true, true, false,
					true, false, true, false, true,
					true, true, true, true, true,
					false, true, false, false, true,
				],
				solution: [
					true, false, false, false, true,
					false, true, false, true, false,
					true, true, true, true, true,
					true, false, true, false, true,
					true, false, true, false, true,
					true, true, true, true, true,
					false, true, false, true, false,
				],
				moves: 6
			},
		];
	}
}

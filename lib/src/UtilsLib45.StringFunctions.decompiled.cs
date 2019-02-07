using System.Linq;

namespace UtilsLib45
{
	public static class StringFunctions
	{
		public static string Reverse(this string s)
		{
			return new string(s.ToCharArray().Reverse().ToArray());
		}
	}
}

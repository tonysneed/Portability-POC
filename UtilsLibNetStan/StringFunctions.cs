using System.Linq;

namespace UtilsLib45
{
    public static class StringFunctions
    {
        public static string Reverse(this string s)
        {
            var chars = s.ToCharArray();
            var result = chars.Reverse();
            return new string(result.ToArray());
        }
    }
}

using System;
using UtilsLib45;

namespace NetCoreConsoleApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Press Ctrl+C to terminate ...");
            while (true)
            {
                Console.WriteLine("\r\nInput:");
                var input = Console.ReadLine();
                var output = input.Reverse();
                Console.WriteLine($"Output: {output}");
            }
        }
    }
}

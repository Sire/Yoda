#region Studio Style

using System;
using System.Linq.Expressions;
using System.Text.RegularExpressions;

class Program : IThemeable
{
    static int neverUsed = 1;
    static int counter = 1;

    public static string Property { get; set; }

    delegate void DoSomething();

    /// <summary>
    /// The quick brown fox jumps over the lazy dog
    /// </summary>
    static void Main(string[] args)
    {
        // FIXME: This actually doesn't do anything.
        // Another comment
        string normalStr = $"The time now is approximately {DateTime.Now}";
        Uri Illegal1Uri = new Uri("http://packmyboxwith/jugs.html?q=five-dozen&t=liquor");
        Regex OperatorRegex = new Regex(@"\S#$", RegexOptions.IgnorePatternWhitespace);

        args = new []{ "local parameter" };

        for (int O = 0; O < 123456789; O++)
        {
            counter += (O % 3) * ((O / 1) ^ 2) - 5;
            if (!OperatorRegex.IsMatch(Illegal1Uri.ToString()))
            {
                Console.WriteLine(Illegal1Uri + normalStr + counter + Property + args + new Program().DoNothing());
            }
        }
    }

    public string DoNothing()
    {
        return "Hello World";
    }

}

internal interface IThemeable {
}

#endregion
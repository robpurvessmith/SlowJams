using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Excel = Microsoft.Office.Interop.Excel;

namespace DerbyExport
{
    class Program
    {
        static void Main(string[] args)
        {
            bool verboseErrors = false;
            try
            {
                string fileName = string.Empty;

                Mono.Options.OptionSet options = new Mono.Options.OptionSet()
                {
                    { "-f|file=", "The data file (xlsx)", val => fileName = val },
                    { "-v|verbose", "Display verbose error messages", val => { if (val != null) { verboseErrors = true; } } }
                };

                options.Parse(args);

                // temp
                if (string.IsNullOrEmpty(fileName))
                {
                    fileName = @"C:\Users\rpsmith\Temp\Derby\Game Stats - Template - 2015-04.xlsx";
                }

                if (!File.Exists(fileName))
                {
                    fileName = Path.Combine(Environment.CurrentDirectory, fileName);
                }
                if (!File.Exists(fileName))
                {
                    Console.WriteLine("That file doesn't exist.");
                    if (verboseErrors)
                    {
                        Console.WriteLine("(I was looking for " + fileName + ")");
                    }
                    return;
                }

                var dbConnection = ConfigurationManager.ConnectionStrings["SlowJams"].ConnectionString;
                FileInfo file = new FileInfo(fileName);

                var derbyEtl = new DerbyETL(file.FullName, dbConnection, verboseErrors);

                Console.WriteLine("Parsing file " + file.Name + " ...");
                derbyEtl.Extract();

                Console.WriteLine("Loading players...");
                derbyEtl.Transform();

                Console.WriteLine("Uploading data...");
                derbyEtl.Load();

                Console.WriteLine("Done.");
            }
            catch (Exception e)
            {
                string error = "Woah, shit just got real yo. Error: " + e.Message;
                if (verboseErrors)
                {
                    error = error + "\r\n" + e.StackTrace;
                }
                Console.WriteLine(error);
            }
        }        
    }
}
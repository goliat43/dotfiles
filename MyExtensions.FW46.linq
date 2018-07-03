<Query Kind="Program">
  <NuGetReference>Newtonsoft.Json</NuGetReference>
  <Namespace>Newtonsoft.Json</Namespace>
</Query>

void Main()
{
	// Write code to test your extensions here. Press F5 to compile and run.
}

public static class MyExtensions
{
	public static object DumpJson(this object value, string description = null)
	{
		return GetJsonDumpTarget(value).Dump(description);
	}



	public static object DumpJson(this object value, string description, int depth)
	{
		return GetJsonDumpTarget(value).Dump(description, depth);
	}



	public static object DumpJson(this object value, string description, bool toDataGrid)

	{

		return GetJsonDumpTarget(value).Dump(description, toDataGrid);

	}

	private static object GetJsonDumpTarget(object value)
	{

		object dumpTarget = value;
		//if this is a string that contains a JSON object, do a round-trip serialization to format it:
		var stringValue = value as string;
		if (stringValue != null)
		{

			if (stringValue.Trim().StartsWith("{") || stringValue.Trim().StartsWith("["))
			{
				var obj = JsonConvert.DeserializeObject(stringValue);
				dumpTarget = JsonConvert.SerializeObject(obj, Newtonsoft.Json.Formatting.Indented);
			}
			else
			{
				dumpTarget = stringValue;
			}
		}
		else
		{
			dumpTarget = JsonConvert.SerializeObject(value, Newtonsoft.Json.Formatting.Indented);
		}

		return dumpTarget;
	}
}

// You can also define non-static classes, enums, etc.






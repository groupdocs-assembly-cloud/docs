---
id: "template-syntax"
url: "assembly/developer-guide/working-with-data"
title: "Working with Data"
weight: 2
productName: "GroupDocs.Assembly Cloud"
description: "Working with Data"
keywords: ""
---

1.  [Using Variables](#HUsingVariables)
2.  [Using Extension Methods](#HUsingExtensionMethods)
    1.  [Using Extension Methods of Iteration Variables](#HUsingExtensionMethodsofIterationVariables)
    2.  [Using Enumeration Extension Methods](#HUsingEnumerationExtensionMethods)
3.  [Data Formatting](#HDataFormatting)
    1.  [Formatting Numeric and DateTime Expressions](#HFormattingNumericandDateTimeExpressions)
    2.  [Additional Number Formats](#HAdditionalNumberFormats)
    3.  [Additional String Formats](#HAdditionalStringFormats)
    4.  [Formatting Options Combinations](#HFormattingOptionsCombinations)
4.  [See Also](#HSeeAlso)

This section describes special techniques, designed to apply data filtering, sorting, groupings and formatting throughout the Report Generation process. There are a number of flexible approaches to data processing depending on what you want to do.

The Reporting Engine supplies a consistent [LINQ](http://ru.wikipedia.org/wiki/Language_Integrated_Query)\-based model for working with data, which specifies what elements to retrieve from the data source and, optionally, how that data elements should be filtered, sorted and grouped before exporting to the resulting document.

In practical terms, this implies the possibility to use a source element sequence as input and change it in different ways to make an output sequence in a final document. This technique is based on Enumeration Extension Methods, many of which take lambda-functions as arguments.

## Using Variables

In the course of data processing, you can define custom variables and use them in expressions. This technique can be useful when you need to calculate expensive expression values just once and apply them several times without the need for recalculation.

You can declare a variable in a document template using a ***var*** tag as follows:

<<var \[variable\_type variable\_name = variable\_value\]>>

After a variable is declared in a template, its value can be accessed using the name of the variable. For example, the following template expression outputs the string “Hello World!”:

<<var \[s = "Hello, "\]>><<\[s\]>><<var \[s = "World!"\]>><<\[s\]>>

Please pay attention, that you can redefine the value of a variable using a ***var*** tag, but you can not redefine the type of it.

## Using Extension Methods

The Reporting Engine enables you to use the following built-in extension methods in template expressions:

*   extension methods of iteration variables;
*   extension methods of enumerations.

### Using Extension Methods of Iteration Variables

The Reporting Engine provides two special extension methods of iteration variables: ***IndexOf()*** and ***NumberOf()***. They are both created to obtain an index of a sequence element, processed and referred by the iteration variable at the moment, but have a very small difference in the base index.

The ***IndexOf()*** extension method returns a zero-based index (0, 1, 2 ...) of a sequence element that is represented by the corresponding iteration variable. You can use this extension method to distinguish sequence items with different indexes and then handle them in different ways.

For example, given that items is an enumeration of the strings “item1”, “item2”, and “item3”, you can use the following template to prefix all of them with commas except the first one :

The items are: <<foreach \[item in items\]>><<\[item.IndexOf() != 0? ", ": ""\]>><<\[item\]>><</foreach\>>.

In this case, the Reporting Engine produces the following output:

The items are: item1, item2, item3.

By analogy with the previous case,the ***NumberOf()*** extension method returns a one-based index (1, 2, 3 ...) of a sequence element.

For example, given the previous declaration of items, you can enumerate and number them in a table, starting naturally with number 1, with the following template:

| Number | Item |
| --- | --- |
| <<foreach \[item in items\]>>  
<<\[item.NumberOf()\]>> | <<\[item\]>><</foreach\>> |

The resulting output would be as follows:

| Number | Item |
| --- | --- |
| 1 | item1 |
| 2 | item2 |
| 3 | item3 |

### Using Enumeration Extension Methods

The Reporting Engine enables you to perform common manipulations on a sequential data through the engine’s built-in extension methods. These extension methods emulate some extension methods of .NET Framework *[IEnumerable](http://msdn.microsoft.com/en-us/library/9eekhta0(v=vs.110).aspx)* interface, providing the same signatures and behavior features.

Thus, you can group, sort, and perform other sequential data manipulations in template expressions in a familiar way.

The following table describes the built-in extension methods. Several notation conventions are used within the table:

*   ***Selector*** stands for a lambda function returning a value and taking an enumeration item as its single argument;
*   ***ComparableSelector*** stands for the ***Selector*** returning *[IComparable](http://msdn.microsoft.com/en-US/library/system.icomparable(v=vs.110).aspx)*;
*   ***Predicate*** stands for the ***Selector*** returning a boolean value.

| Extension Method | Argument | Description | Examples and Notes |
| --- | --- | --- | --- |
| 
All

 | (Predicate) | Determines whether all elements of a sequence satisfy a condition | 

persons.All(p => p.Age < 50)

 |
| 

Any

 | () | Determines whether a sequence contains any elements | 

persons.Any()

 |
| (Predicate) | Determines whether any element of a sequence satisfies a condition | 

persons.Any(p => p.Name == "John Smith")

 |
| 

Average

 | (Selector) | Computes the average of a sequence of numeric values | 

persons.Average(p => p.Age)

The input selector must return a value of any type that has predefined or user-defined addition and division operators.



 |
| 

Concat

 | (IEnumerable) | Concatenates two sequences | 

persons.Concat(otherPersons)

An implicit reference conversion must exist between types of items of concatenated enumerations.



 |
| 

Contains

 | (Object) | Determines whether a sequence contains a specified element | 

persons.Contains(otherPersons.First())

 |
| 

Count

 | () | Returns the number of elements in a sequence | 

persons.Count()

 |
| (Predicate) | Returns a number that represents how many elements in the specified sequence satisfy a condition | 

persons.Count(p => p.Age > 30)

 |
| 

Distinct

 | () | Returns distinct elements from a sequence | 

persons.Distinct()

 |
| 

First

 | () | Returns the first element of a sequence | 

persons.First()

 |
| (Predicate) | Returns the first element in a sequence that satisfies a specified condition | 

persons.First(p => p.Age > 30)

 |
| 

FirstOrDefault

 | () | Returns the first element of a sequence, or a default value if the sequence contains no elements | 

persons.FirstOrDefault()

 |
| (Predicate) | Returns the first element of the sequence that satisfies a condition or a default value if no such element is found | 

persons.FirstOrDefault(p => p.Age > 30)

 |
| 

GroupBy

 | (Selector) | Groups the elements of a sequence according to a specified key selector function and creates a result value from each group and its key | 

persons.GroupBy(p => p.Age)

or

persons.GroupBy(p => new { Age = p.Age, Count = p.Children.Count() })

This method returns an enumeration of group objects. Each group has a unique key defined by the input selector and contains items of the source enumeration associated with this key. You can access the key of a group instance using the Key property. You can treat a group itself as an enumeration of items that the group contains.



 |
| 

Last

 | () | Returns the last element of a sequence | 

persons.Last()

 |
| (Predicate) | Returns the last element of a sequence that satisfies a specified condition | 

persons.Last(p => p.Age > 100)

 |
| 

LastOrDefault

 | () | Returns the last element of a sequence, or a default value if the sequence contains no elements | 

persons.LastOrDefault()

 |
| (Predicate) | Returns the last element of a sequence that satisfies a condition or a default value if no such element is found | 

persons.LastOrDefault(p => p.Age > 100)

 |
| 

Max

 | (ComparableSelector) | Returns the maximum value in a sequence of values | 

persons.Max(p => p.Age)

 |
| 

Min

 | (ComparableSelector) | Returns the minimum value in a sequence of values | 

persons.Min(p => p.Age)

 |
| 

OrderBy

 | (ComparableSelector) | Sorts the elements of a sequence in ascending order | 

persons.OrderBy(p => p.Age)

or  
 

persons.OrderBy(p => p.Age).ThenByDescending(p => p.Name)

or

persons.OrderBy(p => p.Age).ThenByDescending(p => p.Name).ThenBy(p => p.Children.Count())

This method returns an enumeration ordered by a single key. To specify additional ordering keys, you can use the following extension methods of an ordered enumeration:

*   ThenBy(ComparableSelector)
*   ThenByDescending(ComparableSelector)







 |
| 

OrderByDescending



 | (ComparableSelector) | Sorts the elements of a sequence in descending order | 

persons.OrderByDescending(p => p.Age)

or

persons.OrderByDescending(p => p.Age).ThenByDescending(p => p.Name)

or

persons.OrderByDescending(p => p.Age).ThenByDescending(p => p.Name).ThenBy(p => p.Children.Count())





 |
| 

Single

 | () | Returns the only element of a sequence, and throws an exception if there is not exactly one element in the sequence | 

persons.Single()

 |
| (Predicate) | Returns the only element of a sequence that satisfies a specified condition, and throws an exception if more than one such element exists | 

persons.Single(p => p.Name == "John Smith")

 |
| 

SingleOrDefault

 | () | Returns the only element of a sequence, or a default value if the sequence is empty; this method throws an exception if there is more than one element in the sequence | 

persons.SingleOrDefault()

 |
| (Predicate) | Returns the only element of a sequence that satisfies a specified condition or a default value if no such element exists; this method throws an exception if more than one element satisfies the condition | 

persons.SingleOrDefault(p => p.Name == "John Smith")

 |
| 

Skip

 | (int) | Bypasses a specified number of elements in a sequence and then returns the remaining elements | 

persons.Skip(10)

 |
| 

SkipWhile

 | (Predicate) | Bypasses elements in a sequence as long as a specified condition is true and then returns the remaining elements | 

persons.SkipWhile(p => p.Age < 21)

 |
| 

Sum

 | (Selector) | Computes the sum of a sequence of numeric values | 

persons.Sum(p => p.Children.Count())

The input selector must return a value of any type that has a predefined or user-defined addition operator.



 |
| 

Take

 | (int) | Returns a specified number of contiguous elements from the start of a sequence. | 

persons.Take(5)

 |
| 

TakeWhile

 | (Predicate) | Returns elements from a sequence as long as a specified condition is true | 

persons.TakeWhile(p => p.Age < 50)

 |
| 

Union

 | (IEnumerable) | Produces the set union of two sequences | 

persons.Union(otherPersons)

An implicit reference conversion must exist between types of items of united enumerations.



 |
| 

Where

 | (Predicate) | Filters a sequence of values based on a predicate | 

persons.Where(p => p.Age > 18)

 |

## Data Formatting

Formatting is the process of converting an instance of a class (numeric, string, date-time) to its string representation. You can output expression results to your reports using expression tags, which has no special name and consists of the following elements:

*   An ***expression*** enclosed by square brackets.
*   An optional ***format*** string enclosed by double quotes and preceded by the ":" character.
*   An optional ***html*** switch.

The complete syntax of a formatting expression is shown below:

<<\[expression\]:"format" -html>>

If ***html*** switch is present, the expression result is considered to be an HTML block. For example, the following tag is replaced with content like "Bold and italic text" at runtime.

<<\["<b>Bold</b> and <i>italic</i> text"\] -html>>

### Formatting Numeric and DateTime Expressions

To format a numeric or date-time expression result, you can specify a format string as an element of the corresponding expression tag. You can get the detailed information on the possibilities of the base-type formatting in the article "[Format types in .NET](https://docs.microsoft.com/en-us/dotnet/standard/base-types/formatting-types)", submitted by Microsoft.

For example, given that ***d*** is a ***DateTime*** value, you can use the following template to format values using the "***yyyy.MM.dd***" pattern:

<<\[d\]:"yyyy.MM.dd">>

### Additional Number Formats

Several additional number formats, that are missing in standard .NET libraries, are supported:

| Number Format | Description | Examples |
| --- | --- | --- |
| alphabetic | Formats an integer number as an upper-case letter | A, B, C |
| roman | Formats an integer number as an upper-case Roman numeral | I, II, III |
| ordinal | Appends an ordinal suffix to an integer number | 1st, 2nd, 3rd |
| ordinalText | Converts an integer number to its ordinal text representation | First, Second, Third |
| cardinal | Converts an integer number to its text representation | One, Two, Three |
| hex | Formats an integer number as hexadecimal | 8, 9, A, B, C, D, E, F, 10, 11 |
| arabicDash | Encloses an integer number with dashes | \- 1 -, - 2 -, - 3 - |

You can specify one of these additional number formats instead of a format string like in the following example. Given that ***i*** is an integer number, you can format the number as an upper-case letter using the following template:

<<\[i\]:alphabetic>>

### Additional String Formats

Several additional string formats, that are missing in standard .NET libraries, are supported:

| String Format | Description | Examples |
| --- | --- | --- |
| lower | Converts a string to lower case | the string |
| upper | Converts a string to upper case | THE STRING |
| caps | Capitalizes a first letter of every word in a string | The String |
| firstCap | Capitalizes the first letter of the first word in a string | The string |

You can specify one of these additional string formats instead of a format string like in the following example. Given that ***s*** is a string, you can capitalize the first letter of every word in the string using the following template.

<<\[s\]:caps>>

### Formatting Options Combinations

You can also specify one of the additional string formats together with a format string or an additional number format like in the following examples. Given that ***d*** is a ***DateTime*** value, you can convert its textual month representation to upper case using the following template:

<<\[d\]:"MMMM":upper>>

Given that ***i*** is an ***integer*** number, you can convert the number to a lower-case Roman numeral using the following template:

<<\[i\]:roman:lower>>

In contrast to format strings, additional numbers and string formats must not be enclosed with double-quotes.

## See Also

*   An article "[Format types in .NET](https://docs.microsoft.com/en-us/dotnet/standard/base-types/formatting-types)" by Microsoft.

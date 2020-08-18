---
id: "concepts"
url: "assembly/developer-guide/concepts"
title: "Report Generation Concepts"
weight: 1
productName: "GroupDocs.Assembly Cloud"
description: "Report Generation Concepts"
keywords: ""
---

1.  [Data Sources](#HDataSources)
2.  [Tags and Expressions](#HTagsandExpressions)
3.  [Data Bands](#HDataBands)
    1.  [Referencing Fields in a Data Source](#HReferencingFieldsinA0aDataSource)
    2.  [Managing Paragraph Breaks](#HManagingParagraphBreaks)
    3.  [Passing Control to Next Iteration](#HPassingControltoNextIteration)
    4.  [Table-Row Data Band, Spread over Multiple Rows](#HTable-RowDataBand2CSpreadoverMultipleRows)
4.  [Conditional Data Processing](#HConditionalDataProcessing)
5.  [See Also](#HSeeAlso)

GroupDocs.Assembly Cloud is a powerful web-based Document Automation and Report Generation solution, designed to generate data-bound documents through templates dynamically.

The main Report Generation concept is simple and consistent:

![image-20200817080527-1.png](/downloadrev/groupdocs-assembly-cloud-product-family/developer-guide/concepts/WebHome/image-20200817080527-1.png?rev=1.1)

A document template is just a normal document, created using Microsoft Office and OpenOffice, that contains special tags for the dynamic content. You are supposed to use that template to assemble documents on this model repeatedly and consistently.

Have a note, that supported template types are not limited to word-processing document templates only, but also include spreadsheet templates, presentation templates, HTML document templates. email document templates. plain-text templates and others.

## Data Sources

The external** Data Source** lets you define which data set will be used to bind with a document template and subsequently evaluated in the output.

You can use both JSON and XML files for this purpose. Both formats are hierarchical, self-describing and human-readable. However, JSON may have slight built-in advantages, because it is more compact and thus it is quicker to read and write.

You can use the following simple data types in your JSON and XML files:

| Data Type | Description | XML Example | JSON Example |
| --- | --- | --- | --- |
| [Int32](https://docs.microsoft.com/en-us/dotnet/api/system.int32?view=netcore-3.1) | a 32-bit signed integer | <Age>30</Age> | { "Age": "30" } |
| [Int64](https://docs.microsoft.com/en-us/dotnet/api/system.int64?view=netcore-3.1) | a 64-bit signed integer | <Amount>5612456179438</Amount> | { "Amount": "5612456179438" } |
| [Double](https://docs.microsoft.com/en-us/dotnet/api/system?view=netcore-3.1) | a double-precision floating-point number | <Price>253.9</Price> | { "Price": "253.9" } |
| [Boolean](https://docs.microsoft.com/en-us/dotnet/api/system.boolean?view=netcore-3.1) | a Boolean value (True or False) | <IsChecked>True</IsChecked> | { "IsChecked": "True" } |
| [DateTime](https://docs.microsoft.com/en-us/dotnet/api/system?view=netcore-3.1) | an instant in time | <OrderDate>2019-10-01T00:00:00</OrderDate> | { "OrderDate": "2019-10-01T00:00:00" } |
| [String](https://docs.microsoft.com/en-us/dotnet/api/system.string?view=netcore-3.1) | a sequence of Unicode characters | <Name>John Doe</Name> | { "Name": "John Doe" } |

## Tags and Expressions

**Tags** and **Expressions** are the fundamental elements of the report generation technique, that are located in the document template and intended for the purposes of dynamic content management. At its simplest, a tag defines a command for the Reporting Engine, and the expression, which is an integral part of the tag, defines commands parameters.

In terms of Reporting Engine, it does not matter what type of document templates you are working with - regardless of the document template type, tags and expression syntax remains the same anywhere, however, you need to use character escaping when you work with HTML templates.

A tag syntax consists of the following elements: name, expression, optional switches, optional comment, surrounded with a pair of <<, \>> character sequences:

<<tag\_name \[expression\] -switch1 -switch2 ... //comment>>  

Some tags require a corresponding closing tag. A closing tag must match the name of the opening tag with the "/" character preceding its name:

<</tag\_name>>

Depending on the functional role, the following types of tags can be distinguished:

| Tag Type | Functional Role | Tags | Tag Description | Comments |
| --- | --- | --- | --- | --- |
| Control Tags | Provide flow and conditional processing control | ***foreach,*** ***next*** | Provide flow control for traversing elements of a certain type in a sequence |   |
| ***if***, ***else***, ***elseif*** | Provide conditional processing control |   |
| Content Tags | Used to generate and insert different content elements into the output dynamically | 
***backColor***

 | Defines a background-color for text |   |
| ***barcode*** | Inserts a barcode |   |
| ***check*** | Sets a checkbox value |   |
| ***doc*** | Inserts the contents of an external document | currently not supported |
| ***image*** | Inserts an image | currently not supported |
| ***link*** | Inserts a hyperlink |   |
| ***restartNum*** | Restarts a numbering inside a list |   |
| ***var*** | Declares a variable |   |
| Chart Tags | Used to populate charts with data | ***pointColor*** | Defines a color for the chart series |   |
| ***removeif*** | Removes a chart series, depending on the condition |   |
| ***seriesColor*** | Defines a color of a chart series |   |
| ***size*** | Defines a bubble size for a bubble chart |   |
| ***x***, ***y*** | Specifies a data mapping for chart coordinates |   |

Expressions are the most interesting part of a tag syntax. They are composed of operands, usually presented in the form of **data fields**, and **operators**, defined according to [C# Language Specification 5.0](http://www.microsoft.com/en-us/download/details.aspx?id=7029).

## Data Bands

A **data band** is a template for sequential data processing. During the process of document generation, the Reporting Engine connects each data band to the data source using **data field **references and processes it as many times as there are records in the data source. As a result, the data band body is replicated and appended to the output document.

A data band is made up of two parts:

*    A pair of opening and closing ***foreach*** loop tags, that represent the scope of a control flow statement for traversing elements in a sequence. Depending upon the developer's objectives the ***foreach*** tag syntax may vary.
*   A data band body, defined between the ***foreach*** pair of tags, which represents a template for a single element of a sequence. A data band body may contain nested data bands.

The complete syntax of a data band is provided below:

<<foreach \[variable\_type variable\_name in sequence\]>>  
data band body  
<</foreach\>>

An iteration variable, defined by name and type, is intended to reference an element of a sequence inside a data band body. Variable's name and type are optional parameters, and can be specified oromitted depending on the aspects described in the following table:

| Name | Description | Use Aspects |
| --- | --- | --- |
| variable\_type | Variable Type | 
*   If you specify the variable type explicitly, it must be known by the Reporting Engine.
*   If you omit the variable data type, it is determined implicitly depending on the type of the corresponding element sequence.



 |
| variable\_name | Variable Name | 

*   If you specify the variable name, it must be unique within the scope of the corresponding ***foreach*** tag.
*   If you omit the variable name, you can still access the variable’s members using the contextual object member access syntax.



 |

When a data band is related to a list, it is called a ***common data band***.

When a data band is related to a table, that is to a single or multiple rows of a table, it is called a ***table-row data band***. Depending on the objectives, this type of data band may occupy a different number of table rows. In the simplest cases, it occupies a single row, but in more complicated scenarios, that imply the generation of hierarchical tabular data structures, using multirow data bands may be required.

### Referencing Fields in a Data Source

To reference a field inside a data source you must provide a string representation of it. The reference syntax is straightforward:

<<\[field\_reference\]>>

To make this baseline technique clear, let's have a look at the sample data source and the corresponding data band.

The following XML and JSON data sources represent a list of persons, described by their names and ages:

| XML | JSON |
| --- | --- |
| <Persons>  
  <Person>  
     <Name>John Doe</Name>  
     <Age>30</Age>  
  </Person>  
  <Person>  
     <Name>Jane Doe</Name>  
     <Age>27</Age>  
  </Person>  
  <Person>  
     <Name>John Smith</Name>  
     <Age>51</Age>  
  </Person>  
</Persons>
 | {"Persons": {  
   "Person": \[  
      { "Name": "John Doe",  
       "Age": "30"  
      },  
      {  
       "Name": "Jane Doe",  
       "Age": "27"  
      },  
      {  
       "Name": "John Smith",  
       "Age": "51"  
      }  
    \]  
  }  
} |

The corresponding table-row data band is shown below. As you can see, it is referencing ***Name*** and ***Age*** fields inside a ***ds*** data source, and intended to output the sequence of ***Person*** elements data to a tabular format in three columns:

| Number | Name | Age |
| --- | --- | --- |
| <<foreach \[p in ds.Persons\]>>  
<<\[p.NumberOf()\]>>
 | <<\[p.Name\]>> | <<\[p.Age\]>>  
<</foreach\>>

 |
| Count: | <<\[ds.Persons.Count()\]>> |

When the report generation process is complete, you'll see the following output:

| Number | Name | Age |
| --- | --- | --- |
| 1 | John Doe | 30 |
| 2 | Jane Doe | 27 |
| 3 | John Smith | 51 |
| Count: | 3 |

You can also use the Contextual Field Access technique, which enables you to access fields of a data source depending on the processing context. An object, to which the Contextual Field Access can be applied, is determined by the following rules:

*   Inside a data band body, the object is resolved to the iteration variable.
*   Outside a data band body, the object is resolved to a passed data source.

The main syntax differences between the standard and the contextual types of field access are submitted in the following table:

| Type of Field Access | Iteration Loop Syntax | Field Access Syntax |
| --- | --- | --- |
| Standard | <<foreach \[variable in Sequence\]>> | <<\[variable.Field\]>> |
| Contextual | <<foreach \[in Sequence\]>> | <<\[Field\]>> |

The complete table-row data band example, that demonstates the Contextual Field Access technique, is provided below:

| Number | Name | Age |
| --- | --- | --- |
| <<foreach \[in Persons\]\>>  
<<\[NumberOf()\]\>>
 | <<\[Name\]>> | <<\[Age\]>>  
<</foreach\>>

 |
| Count:  | <<\[Persons.Count()\]>> |

### Managing Paragraph Breaks

While building a report, paragraph breaks derive attributes from their template prototypes. In particular, this fact enables you to build numbered or bulleted lists in reports dynamically.

The following table illustrates some common use-cases with a ¶ symbol, that represents a non-printing control character of a paragraph break. Given an enumeration of strings ("item1", "item2", "item3") and a common data band in the left column, you will get the output, shown in the right column:

| A Data Band | The Output |
| --- | --- |
| prefix <<foreach \[item in items\]>><<\[item\]>>¶  
<</foreach\>>suffix | prefix item1¶  
item2¶  
item3¶  
suffix
 |
| prefix<<foreach \[item in items\]>>¶  
<<\[item\]>><</foreach\>> suffix | prefix¶  
item1¶  
item2¶  
item3 suffix

 |
| prefix¶  
<<foreach \[item in items\]>><<\[item\]>>¶  
<</foreach\>>suffix | prefix¶  
item1¶  
item2¶  
item3¶  
suffix

 |
| prefix<<foreach \[item in items\]>>¶  
<<\[item\]>><</foreach\>>¶  
suffix | prefix¶  
item1¶  
item2¶  
item3¶  
suffix

 |

### Passing Control to Next Iteration

You can instruct the Reporting Engine to force movement to the next iteration within a data band using the ***next ***tag. This feature is useful in scenarios when you need to output data of a fixed number of elements in a single row.

In the following example, given an enumeration of Person data elements, you can output their names in a row using the following table-row data band:

<table style="width:500px"><tbody><tr><td style="width:242px"><span class="box"><span class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">foreach</span> [p <span style="font-weight: bold; color: #008000; ">in</span> Persons]&gt;&gt;<br>&lt;&lt;[p.Name]&gt;&gt;</span></span></td><td style="width:132px"><span class="box"><span class="code">&lt;&lt;next&gt;&gt;<br>&lt;&lt;[p.Name]&gt;&gt;</span></span></td><td style="width:325px"><span class="box"><span class="code">&lt;&lt;next&gt;&gt;<br>&lt;&lt;[p.Name]&gt;&gt;<br>&lt;&lt;/<span style="font-weight: bold; color: #008000; ">foreach</span>&gt;&gt;</span></span></td></tr></tbody></table>

The result would be as follows:

<table class="table-bordered" style="width:384px"><tbody><tr><td style="text-align:left; vertical-align:middle; width:124px">John Doe</td><td style="text-align:left; vertical-align:middle; width:125px">Jane Doe</td><td style="text-align:left; vertical-align:middle; width:132px">John Smith</td></tr></tbody></table>

### Table-Row Data Band, Spread over Multiple Rows

The main purpose of a table-row data band, spread over multiple rows, is to generate nested data structures, for example, in-table lists. The body of this data band starts at the beginning of the first occupied row and ends at the end of the last occupied row as follows:

<table class="table-bordered" style="width:464px"><tbody><tr><td style="text-align:center; vertical-align:middle; width:168px"><span class="box"><span class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">foreach</span> ...&gt;&gt;</span></span> ...</td><td style="text-align:center; vertical-align:middle; width:142px">...</td><td style="text-align:center; vertical-align:middle; width:151px">...</td></tr><tr><td style="text-align:center; vertical-align:middle; width:168px">...</td><td style="text-align:center; vertical-align:middle; width:142px">...</td><td style="text-align:center; vertical-align:middle; width:151px">...</td></tr><tr><td style="text-align:center; vertical-align:middle; width:168px">...</td><td style="text-align:center; vertical-align:middle; width:142px">...</td><td style="text-align:center; vertical-align:middle; width:151px">... <span class="box"><span class="code">&lt;&lt;/<span style="font-weight: bold; color: #008000; ">foreach</span>&gt;&gt;</span></span></td></tr></tbody></table>

The next example demonstrates this advanced technique and shows how to populate a ***Manager/Client*** table with a nested in-table ***Contracts*** list. Note that the first (outer) data band, that is responsible for iterating and dealing with ***Manager*** data elements, occupies two table rows:

| Manager / Client | Contract Price |
| --- | --- |
| <<foreach \[m in ds.Managers\]>><<\[m.Name\]>> | <<\[m.Contracts.Sum(c => c.Price)\]>> |
| <<foreach \[c in m.Contracts\]>><<\[c.Clients.Name\]>> | <<\[c.Price\]>><</foreach\>><</foreach\>> |
| Total: | <<\[ds.Contracts.Sum(c => c.Price)\]>> |

## Conditional Data Processing

A conditional block represents a set of template options, bound to associated conditional expressions. During the process of Report Generation, these conditional expressions are sequentially evaluated until an expression that returns True is reached. In this case, the conditional block is replaced with the corresponding template option and populated with data.

A conditional block can have a default template <<else\>> option that is not bound with a conditional expression. This template option is used during the Report Generation process, when none of the conditional expressions return True. If a default template option is missing and none of the conditional expressions return True, then the whole conditional block is removed.

You can use the following syntax to declare a common conditional block:

<<if \[conditional\_expression1\]>>  
    template\_option1  
<<elseif \[conditional\_expression2\]>>  
     template\_option2  
     ...  
<<else\>>  
    default\_template\_option  
<</if\>>

The following example shows how you can use conditional expressions to represent a number of elements in a sequence, handling the situation, when the sequence is empty:

You have chosen <<if \[!items.Any()\]>>no items<<else\>><<\[items.Count()\]>> item(s)<</if\>>.

A template option of a conditional block can be composed of multiple paragraphs and data bands.

For example, given an enumeration of strings ("item1", "item2" and "item3"), you can tentatively check whether the enumeration contains any elements before outputting the list:

<<if \[!items.Any()\]>>No data.<<else\>>  
<<foreach \[item in items\]>><<\[item\]>><</foreach\>><</if\>>

Given the previous declaration of string items, you can use the following template to apply different formatting for even and odd elements of the sequence:

<<foreach \[item in items\]>><<if \[IndexOf() % 2 == 0\]>><<\[item\]>>  
<<else\>>**<<\[item\]>>**  
<</if\>><</foreach\>>

In this case, the engine produces a report as follows:

item1  
**item2**  
item3

By analogy with table-row data bands, when a conditional block is related to a table, that is to a single or multiple rows of a table, it is called a ***table-row conditional block.*** Depending on the objectives, this conditional block may occupy a different number of table rows. In the simplest cases, it occupies a single row, but in many cases, it occupies multiple rows of a table.

The body of table-row conditional block, spread over multiple rows (as well as the body of its every template option), starts at the beginning of the first occupied row and ends at the end of the last occupied row as follows:

<table style="width:427px"><tbody><tr><td style="width:158px"><span class="box"><span class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">if</span> ...&gt;&gt;</span></span> ...</td><td style="width:135px">...</td><td style="width:132px">...</td></tr><tr><td style="width:158px">...</td><td style="width:135px">...</td><td style="width:132px">...</td></tr><tr><td style="width:158px"><span class="box"><span class="code">&lt;&lt;elseif ...&gt;&gt;</span></span> ...</td><td style="width:135px">...</td><td style="width:132px">...</td></tr><tr><td style="width:158px">...</td><td style="width:135px">...</td><td style="width:132px">...</td></tr><tr><td style="width:158px"><span class="box"><span class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">else</span>&gt;&gt;</span></span> ...</td><td style="width:135px">...</td><td style="width:132px">...</td></tr><tr><td style="width:158px">...</td><td style="width:135px">...</td><td style="width:132px">...</td></tr><tr><td style="width:158px">...</td><td style="width:135px">...</td><td style="width:132px">... <span class="box"><span class="code">&lt;&lt;/<span style="font-weight: bold; color: #008000; ">if</span>&gt;&gt;</span></span></td></tr></tbody></table>

## See Also

*   An article "[C# Language Specification 5.0](http://www.microsoft.com/en-us/download/details.aspx?id=7029)" by Microsoft.

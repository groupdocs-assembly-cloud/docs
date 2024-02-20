---
id: "concepts"
url: "assembly/developer-guide/concepts"
title: "Report Generation Concepts"
weight: 1
productName: "GroupDocs.Assembly Cloud"
description: "GroupDocs Assembly Cloud is a powerful Document Automation and Report Generation solution designed to generate data-bound documents through templates."
keywords: "groupdocs assembly cloud report generation document automation templates build generate dynamically syntax tag expression data band source conditional processing"
accent1: "background-color:#b8f2e6;color:#000;"
accent2: "background-color:#ffa69e;color:#000;"
toc: True
---

GroupDocs.Assembly Cloud is a powerful web-based Document Automation and Report Generation solution, designed to generate data-bound documents through templates dynamically.

The main Report Generation concept, presented on the image below, is simple and consistent:

<p align="center"><img src="/assembly/images/concepts/concept.png" alt="Report Generation Concepts" style="width:80%;"></p>

## Document Templates

A document template is just a normal document, created with Microsoft Office, OpenOffice or any other compatible office suite (LibreOffice, WPS Office, Polaris Office, Open365, SoftMaker FreeOffice, etc.), that contains special tags for the dynamic content. You are supposed to use that template to assemble documents on this model repeatedly and consistently.

Have a note, that supported template types are not limited to word-processing document templates only, but also include spreadsheet templates, presentation templates, HTML document templates, email document templates, plain-text templates and others.

## Data Sources

A ***Data Source*** lets you define which data set will be used to bind with a document template and subsequently evaluated in the output.

You can use both JSON and XML files for this purpose. Both formats are hierarchical, self-describing and human-readable. However, JSON may have slight built-in advantages, because it is more compact and thus it is quicker to read and write.

You can use the following simple data types in your JSON and XML files:

<table>
<thead>
<tr>
<th>Data Type</th>
<th>Description</th>
<th>XML Example</th>
<th>JSON Example</th>
</tr>
</thead>
<tbody>
<tr valign="middle">
<td>Int32</td>
<td>A 32-bit signed integer</td>
<td>

`<Age>30</Age>`

</td>
<td>

`{"Age": "30"}`

</td>
</tr>

<tr valign="middle">
<td>Int64</td>
<td>A 64-bit signed integer</td>
<td>

`<Amount>5612456179438</Amount>`

</td>
<td>

`{"Amount": "5612456179438"}`

</td>
</tr>

<tr valign="middle">
<td>Double</td>
<td>A double-precision floating-point number</td>
<td>

`<Price>253.9</Price>`

</td>
<td>

`{"Price": "253.9"}`

</td>
</tr>

<tr valign="middle">
<td>Boolean</td>
<td>A boolean value (True or False)</td>
<td>

`<IsChecked>True</IsChecked>`

</td>
<td>

`{"IsChecked": "True"}`

</td>
</tr>

<tr valign="middle">
<td>DateTime</td>
<td>An instant in time</td>
<td>

`<OrderDate>2019-10-01T00:00:00</OrderDate>`

</td>
<td>

`{"OrderDate": "2019-10-01T00:00:00"}`

</td>
</tr>

<tr valign="middle">
<td>String</td>
<td>A sequence of Unicode characters</td>
<td>

`<Name>John Doe</Name>`

</td>
<td>

`{"Name": "John Doe"}`

</td>
</tr>
</tbody>
</table>

## Tags and Expressions

***Tags*** and ***Expressions*** are the fundamental elements of the report generation technique, that are located in the document template and intended for the purposes of dynamic content management. At its simplest, a tag defines a command for the Reporting Engine, and the expression, which is an integral part of the tag, defines command's parameters.

In terms of the Reporting Engine, it does not matter what type of document templates you are working with — regardless of the document template type, tags and expression syntax remains the same anywhere. However, you need to use character escaping when working with HTML templates.

A tag is surrounded with a pair of "**`<<`**", "**`>>`**" character sequences and consists of the following elements: name, expression, switches and comment:

```C#
<<tagName [expression] -switch1 -switch2 ... //comment>>
```

Some tags require a corresponding closing tag. A closing tag must match the name of the opening tag with the "**`/`**" character preceding its name:

```C#
<</tagName>>
```

Depending on the functional role, the following types of tags can be distinguished:

<table>
    <thead>
        <tr>
            <th>Tag Type</th>
            <th style="width: 20%">Functional Role</th>
            <th style="text-align:center">Tags</th>
            <th>Tags Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td rowspan=2 valign="top">Control Tags</td>
            <td rowspan=2 valign="top">Provides flow and conditional processing control</td>
            <td valign="top" align="center"><b><i><code>foreach</code></i></b>, <b><i><code>next</code></i></b></td>
            <td>Provides flow control for traversing elements of a certain type in a sequence</td>
        </tr>
        <tr>
            <td valign="top" align="center"><b><i><code>if</code></i></b>, <b><i><code>else</code></i></b>, <b><i><code>elseif</code></i></b></td>
            <td>Provides conditional processing control</td>
        </tr>
        <tr>
            <td rowspan=6 valign="top">Content Tags</td>
            <td rowspan=6 valign="top">Used to generate and insert different content elements into the output dynamically</td>
            <td valign="top" align="center"><b><i><code>backColor</code></i></b></td>
            <td>Defines a background-color for a text</td>
        </tr>
        <tr>
            <td valign="top" align="center"><b><i><code>barcode</code></i></b></td>
            <td>Inserts a barcode image</td>
        </tr>
        <tr>
            <td valign="top" align="center"><b><i><code>check</code></i></b></td>
            <td>Sets a checkbox value</td>
        </tr>
        <tr>
            <td valign="top" align="center"><b><i><code>link</code></i></b></td>
            <td>Inserts a hyperlink</td>
        </tr>
        <tr>
            <td valign="top" align="center"><b><i><code>restartNum</code></i></b></td>
            <td>Restarts a numbering inside a list</td>
        </tr>
        <tr>
            <td valign="top" align="center"><b><i><code>var</code></i></b></td>
            <td>Declares a variable</td>
        </tr>
        <tr>
            <td rowspan=5 valign="top">Chart Tags</td>
            <td rowspan=5 valign="top">Used to populate charts with data</td>
            <td valign="top" align="center"><b><i><code>pointColor</code></i></b></td>
            <td>Defines a color for a chart series</td>
        </tr>
        <tr>
            <td valign="top" align="center"><b><i><code>removeif</code></i></b></td>
            <td>Removes a chart series, depending on the condition</td>
        </tr>
        <tr>
            <td valign="top" align="center"><b><i><code>seriesColor</code></i></b></td>
            <td valign="top">Defines a color of a chart series</td>
        </tr>
        <tr>
            <td valign="top" align="center"><b><i><code>size</code></i></b></td>
            <td>Defines a bubble size for a bubble chart</td>
        </tr>
        <tr>
            <td valign="top" align="center"><b><i><code>x</code></i></b>, <b><i><code>y</code></i></b></td>
            <td>Specifies a data mapping for chart coordinates</td>
        </tr>
    </tbody>
</table>

Expressions are the most interesting part of a tag syntax. They are composed of operands, usually presented in the form of ***Data Field*** references, and ***Operators***, defined according to the _"C# Language Specification 5.0"_.

## Data Bands

A ***Data Band*** is a template for sequential data processing. During the document generation process, the Reporting Engine connects each data band to a data source using ***Data Field*** references and processes it as many times as there are records in the data source. As a result, the data band body is replicated and appended to the output document.

### Data Band Syntax

A data band is made up of two parts:

* A pair of opening and closing **`foreach`** loop tags, that represent the scope of a control flow statement for traversing elements in a sequence. Depending upon the developer's objectives the **`foreach`** tag syntax may vary.
* A ***Data Band Body***, defined between the **`foreach`** pair of tags, which represents a template for a single element of a sequence. A data band body may contain nested data bands.

The complete syntax of a data band is provided below:

```C#
<<foreach [varType varName in sequence]>>data_band_body<</foreach>>
```

An iteration variable, defined by name and type, is intended to reference an element of a sequence inside a data band body.

Variable's name and type are optional parameters, that can be specified or omitted depending on the aspects described in the following table:

<table>
    <thead>
        <tr>
            <th>Parameter</th>
            <th>Use Aspects</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td valign="center" align="middle">Variable Type</td>
            <td>
                <ul>
                    <li>If you specify the variable's type explicitly, it must be known by the Reporting Engine.</li>
                    <li>If you omit the variable's data type, it is determined implicitly depending on the type of the corresponding element sequence.</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td valign="center" align="middle">Variable Name</td>
            <td>
                <ul>
                    <li>If you specify the variable's name, it must be unique within the scope of the corresponding foreach tag.</li>
                    <li>If you omit the variable's name, you can still access the variable’s members using the <b><i>Contextual Field Access</i></b> syntax.</li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>

### Data Band Types

When a data band is related to a list, it is called a ***Common Data Band***.

When a data band is related to a table, that is to a single or multiple rows of a table, it is called a ***Table-Row Data Band***.

Depending on the objectives, this type of data band may occupy a different number of table rows. In the simplest cases, it occupies a single row, but in more complicated scenarios, that imply generation of hierarchical tabular data structures, using multirow data bands may be required.

### Referencing Fields in a Data Source

To reference a field inside a data source you must provide a string representation of it.

A field reference syntax is straightforward:

```C#
<<[field_reference]>>
```

To make this baseline technique clear, let's have a look at the sample data sources in XML and JSON and the corresponding data band.

The following XML and JSON data sources represent a list of persons, described by their names and ages.

<table>
<thead>
    <tr>
        <th>XML Data</th>
        <th>JSON Data</th>
    </tr>
</thead>
<tbody>
<tr>
<td valign="top">

```XML
<Persons>  
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
```

</td>
<td valign="top">

```JSON
{"Persons":
  {"Person":
    [  
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
    ]
  }  
}
```

</td>
</tr>
</tbody>
</table>

The corresponding table-row data band is shown below. As you can see, it is referencing the `Name` and `Age` fields inside the `ds` data source, and intended to output the sequence of `Person` elements to a tabular format in three columns:

<table>
<thead>
    <tr>
        <th style="text-align:center; width: 30%">Number</th>
        <th style="text-align:center; width: 40%">Name</th>
        <th style="text-align:center">Age</th>
    </tr>
</thead>
<tbody>
<tr valign="top">
<td>

`<<foreach [p in ds.Persons]>><<[p.NumberOf()]>>`

</td>
<td>

`<<[p.Name]>>`

</td>
<td>

`<<[p.Age]>><</foreach>>`

</td>
</tr>
<tr valign="center">
<td align="left">Count</td>
<td colspan="2">

`<<[ds.Persons.Count()]>>`

</td>
</tr>
</tbody>
</table>

When the report generation process is complete, you'll see the following output:

<table>
<thead>
<tr>
<th style="width: 30%">Number</th>
<th style="width: 40%">Name</th>
<th>Age</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>John Doe</td>
<td>30</td>
</tr>
<tr>
<td>2</td>
<td>Jane Doe</td>
<td>27</td>
</tr>
<tr>
<td>3</td>
<td>John Smith</td>
<td>51</td>
</tr>
<tr>
<td align="left">Count</td>
<td colspan="2">3</td>
</tr>
</tbody>
</table>

You can also use the ***Contextual Field Access*** technique, which enables you to access fields of a data source depending on the processing context. An object, to which the Contextual Field Access can be applied, is determined by the following rules:

* Inside a data band body, the object is resolved to the iteration variable.
* Outside a data band body, the object is resolved to a passed data source.

The main syntax differences between the standard and the contextual types of field access are submitted in the following table:

<table>
<thead>
    <tr>
        <th>Type of Field Access</th>
        <th>Iteration Loop Syntax</th>
        <th>Field Access Syntax</th>
    </tr>
</thead>
<tbody>
<tr valign="top">
<td valign="middle">Standard</td>
<td>

`<<foreach [variable in sequence]>>`
</td>
<td>

`<<[variable.Field]>>`

</td>
<tr valign="top">
<td valign="middle">Contextual</td>
<td>

`<<foreach [in sequence]>>`

</td>
<td>

`<<[Field]>>`

</td>
</tbody>
</table>

The complete table-row data band example, that demonstates the Contextual Field Access technique, is provided below:

<table>
<thead>
    <tr>
        <th style="text-align:center">Number</th>
        <th style="text-align:center">Name</th>
        <th style="text-align:center">Age</th>
    </tr>
</thead>
<tbody>
<tr valign="top">
<td>

`<<foreach [in Persons]>><<[NumberOf()]>>`

</td>
<td>

`<<[Name]>>`

</td>
<td>

`<<[Age]>><</foreach>>`

</td>
</tr>
<tr valign="middle">
<td align="left">Count</td>
<td colspan="2">

`<<[Persons.Count()]>>`

</td>
</tr>
</tbody>
</table>

### Managing Paragraph Breaks

While building a report, paragraph breaks derive attributes from their template prototypes. In particular, this fact enables you to build numbered or bulleted lists in reports dynamically.

The following table illustrates some common use-cases with a "**`¶`**" symbol, that represents a non-printing control character of a paragraph break.

Given an enumeration of strings `["item1", "item2", "item3"]` and a common data band in the left column of the following table, you will get the output, shown in the right column:

<table>
<thead>
    <tr>
        <th style="text-align:center">Data Band</th>
        <th style="text-align:center">Output</th>
    </tr>
</thead>
<tbody>
<tr valign="top">
<td >

```C#
prefix <<foreach [item in items]>><<[item]>>¶
<</foreach>>suffix
```

</td>
<td>

```C#
prefix item1¶`
item2¶
item3¶
suffix
```

</td>
</tr>
<tr valign="top">
<td>

```C#
prefix<<foreach [item in items]>>¶
<<[item]>><</foreach>> suffix
```

</td>
<td>

```C#
prefix¶
item1¶
item2¶
item3 suffix
```

</td>
</tr>
<tr valign="top">
<td>

```C#
prefix¶
<<foreach [item in items]>><<[item]>>¶
<</foreach>>suffix
```

</td>
<td>

```C#
prefix¶
item1¶
item2¶
item3¶
suffix
```

</td>
</tr>
<tr valign="top">
<td>

```C#
prefix<<foreach [item in items]>>¶
<<[item]>><</foreach>>¶
suffix
```

</td>
<td>

```C#
prefix¶
item1¶
item2¶
item3¶
suffix
```

</td>
</tr>
</tbody>
</table>

### Passing Control to the Next Loop Iteration

You can instruct the Reporting Engine to force movement to the next iteration within a data band using the **`next`** tag. This feature is useful in scenarios when you need to output data of a fixed number of elements in a single row.

In the following example, given an enumeration of `Person` data elements, you can output their names in a row using the following table-row data band:

<table>
<thead>
    <tr>
        <th style="text-align:center; width: 34%">Name A</th>
        <th style="text-align:center; width: 33%">Name B</th>
        <th style="text-align:center">Name C</th>
    </tr>
</thead>
<tbody>
<tr valign="top">
<td>

`<<foreach [p in Persons]>><<[p.Name]>>`

</td>
<td>

`<<next>><<[p.Name]>>`

</td>
<td>

`<<next>><<[p.Name]>><</foreach>>`

</td>
</tr>
</table>

The result would be as follows:

<table>
<thead>
    <tr>
        <th style="text-align:center;width: 34%">Name A</th>
        <th style="text-align:center;width: 33%">Name B</th>
        <th style="text-align:center">Name C</th>
    </tr>
</thead>
<tbody>
<tr>
<td>John Doe</td>
<td>Jane Doe</td>
<td>John Smith</td>
</tr>
</tbody>
<table>

### Multi-Row Data Bands

The main purpose of a table-row data band, spread over multiple rows, is to generate nested data structures, for example, in-table lists. The body of this data band starts at the beginning of the first occupied row and ends at the end of the last occupied row as follows:

<table>
<tbody>
<tr valign="middle">
<td>

`<<foreach>>` ...

</td>
<td align="center">...</td>
<td align="center">...</td>
</tr>
<tr valign="middle">
<td colspan="3" align="center">...</td>
</tr>
<tr valign="middle">
<td  align="center">...</td>
<td align="center">...</td>
<td>

... `<</foreach>>`

</td>
</tr>
</tbody>
</table>

The next example demonstrates this advanced technique and shows how to populate a `Manager/Client` table with a nested in-table `Contracts` list. Note that the first (outer) data band, that is responsible for iterating and dealing with `Manager` data elements, occupies two table rows:

<table>
<thead>
    <tr>
        <th style="text-align:center">Manager / Client</th>
        <th style="text-align:center">Contract Price</th>
    </tr>
</thead>
<tbody>
<tr valign="top">
<td>

`<<foreach [m in ds.Managers]>><<[m.Name]>>`

</td>
<td>

`<<foreach [m in ds.Managers]>><<[m.Name]>>`

</td>
</tr>
<tr valign="top">
<td>

`<<foreach [m in ds.Managers]>><<[m.Name]>>`

</td>
<td>

`<<[c.Price]>><</foreach>><</foreach>>`

</td>
</tr>
<tr valign="middle">
<td align="left">Count</td>
<td>

`<<[ds.Contracts.Sum(c => c.Price)]>>`

</td>
</tr>
</tbody>
</table>

## Conditional Data Processing

A ***Conditional Block*** represents a set of template options, bound to associated conditional expressions. During the process of Report Generation, these conditional expressions are sequentially evaluated until an expression that returns `True` is reached. In this case, the conditional block is replaced with the corresponding template option and populated with data.

A conditional block can have a default template `<<else>>` option that is not bound with a conditional expression. This template option is used when none of the conditional expressions return `True`.

You can use the following syntax to declare a conditional block:

```C#
<<if [condition_1]>>
    template_option_1
<<elseif [condition_2]>>
    template_option_2
           ...
<<elseif [condition_N]>>
    template_option_N
<<else>>
    default_template_option
<</if>>
```

The following example shows how you can use conditional expressions to represent a number of elements in a sequence, handling the situation when the sequence is empty:

```C#
You have chosen <<if [!items.Any()]>>no items<<else>><<[items.Count()]>> item(s)<</if>>.
```

A template option of a conditional block can be composed of multiple paragraphs and data bands.

For example, given an enumeration of strings `["item1", "item2", "item3"]`, you can tentatively check whether the enumeration contains any elements before sending them to output:

```C#
<<if [!items.Any()]>>No data.<<else>><<foreach [item in items]>><<[item]>><</foreach>><</if>>
```

Given the previous declaration of string items, you can use the following template to apply different formatting for even and odd elements of the sequence:

<div class="highlight"><pre style="color:#f8f8f2;background-color:#272822;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-C#" data-lang="C#">&lt;&lt;<span style="color:#66d9ef">foreach</span> [item <span style="color:#66d9ef">in</span> items]&gt;&gt;&lt;&lt;<span style="color:#66d9ef">if</span> [IndexOf() % <span style="color:#ae81ff">2</span> == <span style="color:#ae81ff">1</span>]&gt;&gt;<span style="{{< param accent1 >}}">&lt;&lt;[item]&gt;&gt;</span>&lt;&lt;<span style="color:#66d9ef">else</span>&gt;&gt;<span style="{{< param accent2 >}}">&lt;&lt;[item]&gt;&gt;</span>&lt;&lt;/<span style="color:#66d9ef">if</span>&gt;&gt;&lt;&lt;/<span style="color:#66d9ef">foreach</span>&gt;&gt;
</code></pre></div>

In this case, the engine produces a report as follows:

<div class="highlight">
	<pre style="color:#f8f8f2;background-color:#272822;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-C#" data-lang="C#"><span style="{{< param accent1 >}}">item1</span>
<span style="{{< param accent2 >}}">item2</span>
<span style="{{< param accent1 >}}">item3</span>
</code></pre></div>

By analogy with table-row data bands, when a conditional block is related to a table, that is to a single or multiple rows of a table, it is called a ***Table-Row Conditional Block***.

Depending on the objectives, this conditional block may occupy a different number of table rows. In the simplest cases, it occupies a single row, but in many cases it occupies multiple rows of a table.

The body of a table-row conditional block, spread over multiple rows, as well as the body of its every template option, starts at the beginning of the first occupied row and ends at the end of the last occupied row as shown below:

<table>
<tbody>
<tr valign="center">
<td>

`<<if [condition_1]>>` ...

</td>
<td align="middle">...</td>
<td align="middle">...</td>
</tr>

<tr valign="center" style="{{< param accent1 >}}">
<td>

`<<elseif [condition_2]>>` ...

</td>
<td align="middle">...</td>
<td align="middle">...</td>
</tr>

<tr valign="center" style="{{< param accent2 >}}">
<td>

`<<elseif [condition_N]>>` ...

</td>
<td align="middle">...</td>
<td align="middle">...</td>
</tr>

<tr valign="center">
<td>

`<<else>>` ...

</td>
<td align="middle">...</td>
<td>

... `<</if>>`

</td>
</tr>
</tbody>
</table>

## See Also

* [C# Language Specification 5.0](http://www.microsoft.com/en-us/download/details.aspx?id=7029).

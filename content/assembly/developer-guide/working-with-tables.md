---
id: "working-with-tables"
url: "assembly/developer-guide/working-with-tables"
title: "Working with Tables"
weight: 4
productName: "GroupDocs.Assembly Cloud"
description: "Working with Tables"
keywords: ""
---

1. [Generating a Simple Table](#HSimple)
2. [Varying Table's Contents](#HVarying)
3. [Data Filtering and Grouping](#HData)
4. [Calculating a Progressive Total](#HTotal)
5. [Highlighting Rows](#HHighlighting)
6. [Setting Cell's Background Color](#HBackground)
7. [See Also](#HSeeAlso)

Tables are widely used in almost every area of human endeavor to ensure precision, correctness and comparability of data. They organize text into rows and columns, which can make information easy to consolidate and analyze.

The template syntax, which was extensively described in the previous sections, can be applied to tables in the form of data bands and conditional expressions. This is used to generate a range of output rows given a range of different input data elements.

There are several useful techniques you can use within your template expressions to customize table generation. They can be best illustrated with simple examples provided below.

## Generating a Simple Table

The following example shows how to generate a simple In-Table List:

<table>
<thead>
<tr>
<th style="text-align:center">Customer</th>
<th style="text-align:center">Order Price</th>
</tr>
</thead>
<tbody>
<tr valign="top">
<td>

```C#
<<foreach [in customers]>><<[CustomerName]>>
```

</td>
<td>

```C#
<<[Order.Sum(c => c.Price)]>><</foreach>>
```

</td>
</tr>
<tr valign="middle">
<td align="right"><b>Total</b></td>
<td>

```C#
<<[Sum(m => m.Order.Sum(c => c.Price))]>>
```

</td>
</tr>
</tbody>
</table>

## Varying Table's Contents

The following example shows how to generate an In-Table List with a variable contents using conditional expressions:

<table>
<thead>
<tr>
<th style="text-align:center">Customer</th>
<th style="text-align:center">Order Price</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2" align="center">

```C#
<<if [!Any()]>>No data
```

</td>
</tr>

<tr valign="top">
<td>

```C#
<<else>><<foreach [in orders]>><<[Product.ProductName]>>
```

</td>
<td>

```C#
<<[Price]>><</foreach>>
```

</td>
</tr>
<tr valign="middle">
<td align="right"><b>Total</b></td>
<td>

```C#
<<[Sum(c => c.Price)]>><</if>>
```

</td>
</tr>
</tbody>
</table>

## Data Filtering and Grouping

The following example shows how to generate an In-Table List with data filtering and grouping:

<table>
<thead>
<tr>
<th style="text-align:center">Customer</th>
<th style="text-align:center">Order Price</th>
</tr>
</thead>
<tbody>
<tr valign="top">
<td>

```C#
<<foreach [in orders.Where(c => c.OrderDate.Year == 2020).GroupBy(c => c.Customer).OrderBy(g => g.Key.CustomerName)]>><<[Key.CustomerName]>>
```

</td>
<td>

```C#
<<[Sum(c => c.Price)]>><</foreach>>
```

</td>
</tr>
</tbody>
</table>

## Calculating a Progressive Total

The following example shows how to generate an In-Table List with a progressive total, that requires using a ***var*** tag:

<table>
<thead>
<tr>
<th style="text-align:center">Customer</th>
<th style="text-align:center">Order Price</th>
</tr>
</thead>
<tbody>
<tr valign="top">
<td>

```C#
<<var [total = 0.0]>><<foreach [in orders]>><<[Customer.CustomerName]>>
```

</td>
<td>

```C#
<<var [total = total + Price]>><<[total]>><</foreach>>
```

</td>
</tr>
</tbody>
</table>

## Highlighting Rows

The following example shows how to generate an In-Table List with row highlighting:

<table>
<thead>
<tr>
<th style="text-align:center">Customer</th>
<th style="text-align:center">Order Price</th>
</tr>
</thead>
<tbody>
<tr valign="top" bgcolor="darkgreen">
<td>

```C#
<<foreach [in orders]>><<if [Price >= 400]>><<[Customer.CustomerName]>>
```

</td>
<td>

```C#
<<[Price]>>
```

</td>
</tr>

<tr valign="top">
<td>

```C#
<<else>><<[Customer.CustomerName]>>
```

</td>
<td>

```C#
<<[Price]>><</if>><</foreach>>
```

</td>
</tr>
</tr>
<tr valign="middle">
<td align="right"><b>Total</b></td>
<td>

```C#
<<[Sum(c => c.Price)]>>
```

</td>
</tr>

</tbody>
</table>

## Setting Cell's Background Color

The following example shows how to generate an In-Table List with a background color:

<table>
<thead>
<tr>
<th style="text-align:center">Customer</th>
<th style="text-align:center">Order Price</th>
</tr>
</thead>
<tbody>
<tr valign="top">
<td>

```C#
<<var [total = 0.0]>><<foreach [in orders]>><<backColor[color]>><<[Customer.CustomerName]>><</backColor>>
```

</td>
<td>

```C#
<<var [total = total + Price]>><<[total]>><</foreach>>
```

</td>
</tr>
</tbody>
</table>

## See Also

* A complete example of table generation technique from the [Quick Start]() section.

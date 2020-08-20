﻿---
id: "working-with-tables"
url: "assembly/developer-guide/working-with-tables"
title: "Working with Tables"
weight: 4
productName: "GroupDocs.Assembly Cloud"
description: "Working with Tables"
keywords: ""
accent1: "background-color:#b8f2e6;color:#000;"
accent2: "background-color:#ffa69e;color:#000;"
---

1. [Generating a Simple Table]({{< param url >}}/#generating-a-simple-table)
2. [Varying Table's Contents]({{< param url >}}/#varying-tables-contents)
3. [Data Filtering and Grouping]({{< param url >}}/#data-filtering-and-grouping)
4. [Calculating a Progressive Total]({{< param url >}}/#calculating-a-progressive-total)
5. [Highlighting Rows]({{< param url >}}/#highlighting-rows)
6. [Setting Cell's Background Color]({{< param url >}}/#setting-cells-background-color)
7. [See Also]({{< param url >}}/#see-also)

Tables are widely used in almost every area of human endeavor to ensure precision, correctness and comparability of data. They organize text into rows and columns, which can make information easy to consolidate and analyze.

The template syntax, which was extensively described in the previous sections, can be applied to tables in the form of data bands and conditional expressions. This is used to generate a range of output rows given a range of different input data elements.

There are several useful techniques you can use within your template expressions to customize table generation. They can be best illustrated with simple examples provided below.

## Generating a Simple Table

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

`<<foreach [in customers]>><<[CustomerName]>>`

</td>
<td>

`<<[Order.Sum(c => c.Price)]>><</foreach>>`

</td>
</tr>
<tr valign="middle">
<td align="right"><b>Total</b></td>
<td>

`<<[Sum(m => m.Order.Sum(c => c.Price))]>>`

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

`<<if [!Any()]>>`No data

</td>
</tr>

<tr valign="top">
<td>

`<<else>><<foreach [in orders]>><<[Product.ProductName]>>`

</td>
<td>

`<<[Price]>><</foreach>>`

</td>
</tr>
<tr valign="middle">
<td align="right"><b>Total</b></td>
<td>

`<<[Sum(c => c.Price)]>><</if>>`

</td>
</tr>
</tbody>
</table>

## Data Filtering and Grouping

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

`<<foreach [in orders.Where(c => c.OrderDate.Year == 2020).GroupBy(c => c.Customer).OrderBy(g => g.Key.CustomerName)]>><<[Key.CustomerName]>>`

</td>
<td>

`<<[Sum(c => c.Price)]>><</foreach>>`

</td>
</tr>
</tbody>
</table>

## Calculating a Progressive Total

The following example shows how to generate an In-Table List with a progressive total, that requires using a **`var`** tag:

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

`<<var [total = 0.0]>><<foreach [in orders]>><<[Customer.CustomerName]>>`

</td>
<td>

`<<var [total = total + Price]>><<[total]>><</foreach>>`

</td>
</tr>
</tbody>
</table>

## Highlighting Rows

The following example shows how to generate an In-Table List with row highlighting:

<table>
<thead>
<tr>
<th style="text-align:center">Customer</th>
<th style="text-align:center">Order Price</th>
</tr>
</thead>
<tbody>
<tr valign="top" style="{{< param accent1 >}}">
<td>

`<<foreach [in orders]>><<if [Price >= 400]>><<[Customer.CustomerName]>>`

</td>
<td>

`<<[Price]>>`

</td>
</tr>

<tr valign="top" style="{{< param accent2 >}}">
<td>

`<<else>><<[Customer.CustomerName]>>`

</td>
<td>

`<<[Price]>><</if>><</foreach>>`

</td>
</tr>
<tr valign="middle">
<td align="right"><b>Total</b></td>
<td>

`<<[Sum(c => c.Price)]>>`

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

`<<var [total = 0.0]>><<foreach [in orders]>><<backColor[color]>><<[Customer.CustomerName]>><</backColor>>`

</td>
<td>

`<<var [total = total + Price]>><<[total]>><</foreach>>`

</td>
</tr>
</tbody>
</table>

## See Also

* A complete table generation [example](/assembly/getting-started/quick-start/#generating-a-report-in-three-steps) from the "Quick Start" section.
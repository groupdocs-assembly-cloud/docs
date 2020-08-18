---
id: "working-with-tables"
url: "assembly/developer-guide/working-with-tables"
title: "Working with Tables"
weight: 4
productName: "GroupDocs.Assembly Cloud"
description: "Working with Tables"
keywords: ""
---

1.  [Generating a Simple Table](#HGeneratingaA0SimpleTable)
2.  [Varying Table's Contents](#HVaryingTable27sContents)
3.  [Data Filtering and Grouping](#HDataA0FilteringandGrouping)
4.  [Calculating a Progressive Total](#HCalculatingaProgressiveTotal)
5.  [Highlighting Rows](#HHighlightingA0Rows)
6.  [Setting Cell's Background Color](#HSettingCell27sBackgroundColor)
7.  [See Also](#HSeeAlso)

Tables are widely used in almost every area of human endeavor to ensure precision, correctness and comparability of data. They organize text into rows and columns, which can make information easy to consolidate and analyze.

The template syntax, which was extensively described in the previous sections, can be applied to tables in the form of data bands and conditional expressions. This is used to generate a range of output rows given a range of different input data elements.

There are several useful techniques you can use within your template expressions to customize table generation. They can be best illustrated with simple examples provided below.

## Generating a Simple Table

The following example shows how to generate a simple In-Table List:

<table class="table-bordered"><tbody><tr><td style="width:275px"><strong>Customer</strong></td><td style="width:423px"><strong>Order Price</strong></td></tr><tr><td style="width:275px"><span class="box"><span class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">foreach</span> [<span style="font-weight: bold; color: #008000; ">in</span> customers]&gt;&gt;<br>&lt;&lt;[CustomerName]&gt;&gt;</span></span></td><td style="width:423px"><span class="box"><span class="code">&lt;&lt;[Order.Sum(c =&gt; c.Price)]&gt;&gt;<br>&lt;&lt;/<span style="font-weight: bold; color: #008000; ">foreach</span>&gt;&gt;</span></span></td></tr><tr><td style="width:275px">Total:</td><td style="width:423px"><span class="box"><span class="code">&lt;&lt;[Sum(m =&gt; m.Order.Sum(c =&gt; c.Price))]&gt;&gt;</span></span></td></tr></tbody></table>

## Varying Table's Contents

The following example shows how to generate an In-Table List with a variable contents using conditional expressions:

<table class="table-bordered" style="width:521px"><tbody><tr><td style="width:295px"><strong>Products</strong></td><td style="width:224px"><strong>Order Price</strong></td></tr><tr><td colspan="2" style="text-align:center; width:520px"><span class="box"><span class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">if</span> [!Any()]&gt;&gt;</span></span>No data</td></tr><tr><td style="width:295px"><span class="box"><span class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">else</span>&gt;&gt;&lt;&lt;<span style="font-weight: bold; color: #008000; ">foreach</span> [<span style="font-weight: bold; color: #008000; ">in</span> orders]&gt;&gt;<br>&lt;&lt;[Product.ProductName]&gt;&gt;</span></span></td><td style="width:224px"><span class="box"><span class="code">&lt;&lt;[Price]&gt;&gt;&lt;&lt;/<span style="font-weight: bold; color: #008000; ">foreach</span>&gt;&gt;</span></span></td></tr><tr><td style="width:295px">Total:</td><td style="width:224px"><span class="box"><span class="code">&lt;&lt;[Sum(c =&gt; c.Price)]&gt;&gt;&lt;&lt;/<span style="font-weight: bold; color: #008000; ">if</span>&gt;&gt;</span></span></td></tr></tbody></table>

## Data Filtering and Grouping

The following example shows how to generate an In-Table List with data filtering and grouping:

<table class="table-bordered"><tbody><tr><td style="width:377px"><strong>Customer</strong></td><td style="width:321px"><strong>Order Price</strong></td></tr><tr><td style="width:377px"><span class="box"><span class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">foreach</span> [<span style="font-weight: bold; color: #008000; ">in</span> orders<br>&nbsp;&nbsp;&nbsp;&nbsp;.Where(c =&gt; c.OrderDate.Year == <span style="color: #666666; ">2020</span>)<br>&nbsp;&nbsp;&nbsp;&nbsp;.GroupBy(c =&gt; c.Customer)<br>&nbsp;&nbsp;&nbsp;&nbsp;.OrderBy(g =&gt; g.Key.CustomerName)]&gt;&gt;<br>&lt;&lt;[Key.CustomerName]&gt;&gt;</span></span><div><div><p>&nbsp;</p></div></div></td><td style="width:321px"><span class="box"><span class="code">&lt;&lt;[Sum(c =&gt; c.Price)]&gt;&gt;<br>&lt;&lt;/<span style="font-weight: bold; color: #008000; ">foreach</span>&gt;&gt;</span></span></td></tr></tbody></table>

## Calculating a Progressive Total

The following example shows how to generate an In-Table List with a progressive total, that requires using a ***var*** tag:

<<var \[total = 0.0\]>>

<table class="table-bordered"><tbody><tr><td style="width:319px"><strong>Customer</strong></td><td style="width:380px"><strong>Total Price</strong></td></tr><tr><td style="width:319px"><span class="box"><span class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">foreach</span> [<span style="font-weight: bold; color: #008000; ">in</span> orders]&gt;&gt;<br>&lt;&lt;[Customer.CustomerName]&gt;&gt;</span></span><div><p>&nbsp;</p></div></td><td style="width:380px"><span class="box"><span class="code">&lt;&lt;<span style="color: #B00040; ">var</span> [total = total + Price]&gt;&gt;&lt;&lt;[total]&gt;&gt;<br>&lt;&lt;/<span style="font-weight: bold; color: #008000; ">foreach</span>&gt;&gt;</span></span></td></tr></tbody></table>

## Highlighting Rows

The following example shows how to generate an In-Table List with row highlighting:

<table class="table-bordered"><tbody><tr><td style="width:322px"><strong>Customer</strong></td><td style="width:376px"><strong>Order Price</strong></td></tr><tr><td class="mark" style="width:322px"><div><div class="box"><div class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">foreach</span> [<span style="font-weight: bold; color: #008000; ">in</span> orders]&gt;&gt;<br>&lt;&lt;<span style="font-weight: bold; color: #008000; ">if</span> [Price &gt;= <span style="color: #666666; ">400</span>]&gt;&gt;<br>&lt;&lt;[Customer.CustomerName]&gt;&gt;</div></div></div></td><td class="mark" style="width:376px"><span class="box"><span class="code">&lt;&lt;[Price]&gt;&gt;</span></span></td></tr><tr><td style="width:322px"><span class="box"><span class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">else</span>&gt;&gt;&lt;&lt;[Customer.CustomerName]&gt;&gt;</span></span></td><td style="width:376px"><span class="box"><span class="code">&lt;&lt;[Price]&gt;&gt;&lt;&lt;/<span style="font-weight: bold; color: #008000; ">if</span>&gt;&gt;&lt;&lt;/<span style="font-weight: bold; color: #008000; ">foreach</span>&gt;&gt;</span></span></td></tr><tr><td style="width:322px">Total:</td><td style="width:376px"><span class="box"><span class="code">&lt;&lt;[Sum(c =&gt; c.Price)]&gt;&gt;</span></span></td></tr></tbody></table>

## Setting Cell's Background Color

The following example shows how to generate an In-Table List with a background color:

<<var \[total = 0.0\]>>

<table class="table-bordered"><tbody><tr><td style="width:331px"><strong>Customer</strong></td><td style="width:367px"><strong>Total Price</strong></td></tr><tr><td style="width:331px"><div><div class="box"><div class="code">&lt;&lt;<span style="font-weight: bold; color: #008000; ">foreach</span> [<span style="font-weight: bold; color: #008000; ">in</span> orders]&gt;&gt;<br>&lt;&lt;backColor[color]&gt;&gt;<br>&lt;&lt;[Customer.CustomerName]&gt;&gt;<br>&lt;&lt;/backColor&gt;&gt;</div></div></div></td><td style="width:367px"><span class="box"><span class="code">&lt;&lt;<span style="color: #B00040; ">var</span> [total = total + Price]&gt;&gt;<br>&lt;&lt;[total]&gt;&gt;&lt;&lt;/<span style="font-weight: bold; color: #008000; ">foreach</span>&gt;&gt;</span></span></td></tr></tbody></table>

## See Also

*   A complete example of table generation technique from the [Quick Start](/get/groupdocs-assembly-cloud-product-family/developer-guide/working-with-charts/?sheet=CKEditor.ResourceDispatcher&outputSyntax=plain&language=en&type=doc&reference=groupdocs-assembly-cloud-product-family.getting-started.quick-start.WebHome&typed=true) section.

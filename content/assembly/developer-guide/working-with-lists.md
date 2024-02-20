---
id: "working-with-lists"
url: "assembly/developer-guide/working-with-lists"
title: "Working with Lists"
weight: 3
productName: "GroupDocs.Assembly Cloud"
description: "How-to dynamically generate items within different types of lists and specify their options using GroupDocs Assembly Cloud."
keywords: "groupdocs assembly cloud report generation document automation templates build generate insert list items dynamically"
accent1: "background-color:#b8f2e6;color:#000;"
accent2: "background-color:#ffa69e;color:#000;"
toc: True
---

Lists are extensively used in documents to emphasize important ideas and increase the readability of text by arranging and formatting information.

In this section we'll show you how to dynamically generate items within different types of lists and specify their options. For this purpose, we'll use a sample data source, presented at the end of this page, and a number of prime template examples provided below.

## In-Paragraph List

An in-paragraph list is the most simple and straightforward form of the list, where items are embedded into the text of a paragraph.

You can generate an in-paragraph list with the following data band:

```C#
We provide support fоr the following products: <<foreach [in products]>><<[IndexOf() != 0 ? ", " : ""]>><<[ProductName]>><</foreach>>.
```

The result would be as follows:

```HTML
We provide support for the following products: LG Nexus 5, Nokia Lumia 5801, Huawie Mate S, Moto Style.
```

## Bulleted List

A list, which items are marked out with bullets, is called a ***Bulleted List***. The bullet symbol may take a variety of shapes, such as circular, square, diamond, arrow and other. You can use any bullet symbol in your document template.

The following example shows how to generate a bulleted list with circular bullets:

```C#
•  <<foreach [in products]>><<[ProductName]>>
<</foreach>>
```

The result would be as follows:

```HTML
•  LG Nexus 5
•  Nokia Lumia 5801
•  Huawie Mate S
•  Moto Style
```

## Numbered List

You can generate a numbered list with the following data band:

```C#
1. <<foreach [in products]>><<[ProductName]>>
<</foreach>>
```

The result would be as follows:

```HTML
1. LG Nexus 5
2. Nokia Lumia 5801
3. Huawie Mate S
4. Moto Style
```

When working with a nested numbered list you can use a ***Numbering Restart*** feature to control the indexation options of the nested element sequence. To implement this you need to put a **`restartNum`** tag before the corresponding **`foreach`** tag in the nested numbered paragraph.

This technique is illustrated in the following example with two interrelated data bands. The outer loop is involved in the processing of `Order` data elements, while the inner loop is dealing with the `Service` data elements, related to each `Order` element.

You can restart list numbering of an inner loop on each outer loop iteration as follows:

```C#
<<foreach [order in Orders]>><<[order.ClientName]>><<[order.ClientAddress]>>
1. <<restartNum>><<foreach [service in order.Services]>><<[service.Name]>>  
<</foreach>><</foreach>>
```

## Colouring List Items

You can apply dynamic item colouring using conditional expressions.

The following example shows how you can define different colouring options for even and odd elements of the sequence:

<div class="highlight"><pre style="color:#f8f8f2;background-color:#272822;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-C#" data-lang="C#">We provide support <span style="color:#66d9ef">for</span> the following products:
<span style="color:#ae81ff">1.</span> &lt;&lt;<span style="color:#66d9ef">foreach</span> [<span style="color:#66d9ef">in</span> products]&gt;&gt;&lt;&lt;<span style="color:#66d9ef">if</span> [IndexOf() % <span style="color:#ae81ff">2</span> == <span style="color:#ae81ff">1</span>]&gt;&gt;<span style="{{< param accent2 >}}">&lt;&lt;[ProductName]&gt;&gt;</span>
<span style="color:#ae81ff">2.</span> &lt;&lt;<span style="color:#66d9ef">else</span>&gt;&gt;<span style="{{< param accent1 >}}">&lt;&lt;[ProductName]&gt;&gt;</span>&lt;&lt;/<span style="color:#66d9ef">if</span>&gt;&gt;&lt;&lt;/<span style="color:#66d9ef">foreach</span>&gt;&gt;
</code></pre></div>

The result would be as follows:

<div class="highlight"><pre style="color:#f8f8f2;background-color:#272822;-moz-tab-size:4;-o-tab-size:4;tab-size:4">
<code class="language-HTML" data-lang="HTML">We provide support for the following products:
<span style="{{< param accent2 >}}">1. LG Nexus 5</span>
<span style="{{< param accent1 >}}">2. Nokia Lumia 5801</span>
<span style="{{< param accent2 >}}">3. Huawie Mate S</span>
<span style="{{< param accent1 >}}">4. Moto Style</span>
</code></pre></div>

## Sample Data Source

The following XML and JSON data sources represent a list of persons, described by their names and ages:

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
<Products>
    <Product>
        <Discount>0</Discount>
        <ProductID>1</ProductID>
        <ProductName>LG Nexus 5</ProductName>
        <ProductPrice>350</ProductPrice>
        <UnitsInStock>5</UnitsInStock>
    </Product>
    <Product>
        <Discount>10</Discount>
        <ProductID>2</ProductID>
        <ProductName>Nokia Lumia 5801</ProductName>
        <ProductPrice>250</ProductPrice>
        <UnitsInStock>10</UnitsInStock>
    </Product>
    <Product>
        <Discount>0</Discount>
        <ProductID>3</ProductID>
        <ProductName>Huawie Mate S</ProductName>
        <ProductPrice>400</ProductPrice>
        <UnitsInStock>8</UnitsInStock>
    </Product>
    <Product>
        <Discount>0</Discount>
        <ProductID>4</ProductID>
        <ProductName>Moto Style</ProductName>
        <ProductPrice>355</ProductPrice>
        <UnitsInStock>5</UnitsInStock>
    </Product>
</Products>
```

</td>
<td valign="top">

```JSON
{    "Products": {
         "Product": [
            {   "Discount": "0",
                "ProductID": "1",
                "ProductName": "LG Nexus 5",
                "ProductPrice": "350",
                "UnitsInStock": "5"
            },
            {
                "Discount": "10",
                "ProductID": "2",
                "ProductName": "Nokia Lumia 5801",
                "ProductPrice": "250",
                "UnitsInStock": "10"
            },
            {
                "Discount": "0",
                "ProductID": "3",
                "ProductName": "Huawie Mate S",
                "ProductPrice": "400",
                "UnitsInStock": "8"
            },
            {
                "Discount": "0",
                "ProductID": "4",
                "ProductName": "Moto Style",
                "ProductPrice": "355",
                "UnitsInStock": "5"
            }
        ]
    }
}
```

</td>
</tr>
</tbody>
</table>

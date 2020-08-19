---
id: "working-with-lists"
url: "assembly/developer-guide/working-with-lists"
title: "Working with Lists"
weight: 3
productName: "GroupDocs.Assembly Cloud"
description: "Working with Lists"
keywords: ""
---

1. [In-Paragraph List](#HInParagraphList)
2. [Bulleted List](#HBulletedList)
3. [Numbered List](#HNumberedList)
4. [Colouring List Items](#HColouringListItems)
5. [Sample Data Source](#HSampleDataSource)

Lists are extensively used in documents to emphasize important ideas and increase the readability of text by arranging and formatting information.

In this section, we'll show you how to dynamically generate items within different types of lists and specify their options. For this purpose, we'll use a sample data source, presented at the end of this page, and a number of prime template examples provided below.

## In-Paragraph List

An in-paragraph list is the most simple and straightforward form of the list, where items are embedded into the text of a paragraph.

You can generate an in-paragraph list with the following data band:

```C#
We provide support fоr the following products: <<foreach \[in products]>><<[IndexOf() != 0 ? ", " : ""]>><<[ProductName]>><</foreach>>.
```

The result would be as follows:

```HTML
We provide support for the following products: LG Nexus 5, Nokia Lumia 5801, Huawie Mate S, Moto Style.
```

## Bulleted List

A list, which items are marked out with bullets, is called a bulleted lists. The bullet symbol may take a variety of shapes, such as circular, square, diamond, arrow and other. You can use any bullet symbol in your document template.

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

You can generate a numbered h list with the following data band:

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

When working with a nested numbered list you can use a **Numbering Restart** feature to control indexation options of nested element sequences. To implement this you need to put a ***`restartNum`*** tag before the corresponding ***`foreach`*** tag in the nested numbered paragraph.

This technique is illustrated in the following example with two interrelated data bands. The outer loop is involved in the processing of `Order` data elements, while the inner loop is dealing with the `Service` data elements, related to each `Order` element.

You can restart list numbering of an inner loop on each outer loop iteration as follows:

```C#
<<foreach [order in Orders]>><<[order.ClientName]>> (<<[order.ClientAddress]>>)  
1. <<restartNum>><<foreach [service in order.Services]>><<[service.Name]>>  
<</foreach>><</foreach>>
```

## Colouring List Items

You can apply dynamic item colouring using conditional expressions.

The following example shows how you can define different colouring options for even and odd elements of the sequence:

```C#
We provide support for the following products:
1. <<foreach [in products]>><<if [IndexOf() % 2 == 0]>><<[ProductName]>>
2. <<else>><<[ProductName]>><</if>><</foreach>>
```

The result would be as follows:

```HTML
We provide support for the following products:
1. LG Nexus 5
2. Nokia Lumia 5801
3. Huawie Mate S
4. Moto Style
```

## Sample Data Source

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
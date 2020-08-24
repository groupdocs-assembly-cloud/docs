---
id: "working-with-other-elements"
url: "assembly/developer-guide/working-with-other-elements"
title: "Working with Hyperlinks, Bookmarks, Checkboxes, Barcodes"
weight: 6
productName: "GroupDocs.Assembly Cloud"
description: "Working with Hyperlinks, Bookmarks, Checkboxes, Barcodes"
keywords: ""
---

1. [Inserting a Hyperlink]({{< param url >}}/#inserting-a-hyperlink)
    * [Inserting a Hyperlink into a Word-Processing Document or Email]({{< param url >}}/#inserting-a-hyperlink-into-a-word-processing-document-or-email)
    * [Inserting a Hyperlink into a Spreadsheet]({{< param url >}}/#inserting-a-hyperlink-into-a-spreadsheet)
    * [Inserting a Hyperlink into a Presentation]({{< param url >}}/#inserting-a-hyperlink-into-a-presentation)
2. [Inserting a Bookmark]({{< param url >}}/#inserting-a-bookmark)
3. [Setting Checkbox Values]({{< param url >}}/#setting-checkbox-values)
4. [Generating and Inserting a Barcode Image]({{< param url >}}/#generating-and-inserting-a-barcode-image)
    * [Setting a Barcode Type]({{< param url >}}/#setting-a-barcode-type)

This section describes template tags used to generate and insert different types of elements, such as hyperlinks, bookmarks, checkboxes, barcodes, into reports dynamically.

## Inserting a Hyperlink

You can insert hyperlinks to different types of documents: word-processing documents and emails, spreadsheet and presentation documents. The following subsections show some tag syntax differences applied to each document type.

### Inserting a Hyperlink into a Word-Processing Document or Email

You can insert links to bookmarks using the **`link`** tags.
The syntax of a **`link`** tag is defined as follows:

```C#
<<link [reference][text]>>
```

Here, a mandatory `reference` parameter defines either an ***URI***, which represents a hyperlink to an external resource, or the name of a ***Bookmark*** within the same document. If a `reference` represents the name of a bookmark, then the corresponding link navigates to the documents bookmark.

An optional `text` parameter can be omitted. In this case, a text from the `reference` parameter is used by default.

Have a note that a **`link`** tag cannot be used within charts.

### Inserting a Hyperlink into a Spreadsheet

For spreadsheet documents, the behavior of **`link`** tags is different. Here, a `reference` parameter represents a ***Cell*** or a ***Cell Range***.

Some common use-cases are shown in the following table:

| Description | Format | Example |
| --- | --- | --- |
| Local reference to a Cell | `cellName` | B11 |
| Reference to a Cell within another Worksheet | `worksheetName!cellName` | Sheet2!A1 |
| Local reference to a Cell Range  | `startCellName:endCellName` | B3:B7 |
| Reference to a Cell Range within another Worksheet | `worksheetName!startCellName:endCellName` | Sheet3!A2:C2 |

### Inserting a Hyperlink into a Presentation

For Presentation documents, the behavior of **`link`** tags is also different. Here, a `reference` parameter represents a reference to a slide within the same presentation, defined by a "Slide`N`" string, where `N` is a slide number.

The following example demonstrates how to insert a link to a second slide of a presentation:

```C#
<<link ["Slide2"] ["A reference to a second slide"]>>
```

## Inserting a Bookmark

You can insert bookmarks to your Word-processing documents and emails using **`bookmark`** tags. The syntax of a **`bookmark`** tag is defined as follows:

```C#
<<bookmark [bookmarkName]>>content<</bookmark>>
```

Here, a mandatory `bookmarkName` parameter defines the name of a bookmark to be inserted.

## Setting Checkbox Values

You can set a Checkbox state to either checked or unchecked in your Word-based documents by taking the following steps:

1. Add a Checkbox content control to your document template.
2. By editing content properties of a Checkbox control, add a **`check`** tag to its title using the following syntax:

```C#
<<check [condition]>>
```

Here, a mandatory `condition` parameter of a `boolean` type, defines a condition upon which the value of the Checkbox is set to checked state.

## Generating and Inserting a Barcode Image

You can generate and insert barcode images to your documents using a **`barcode`** tag. To declare a dynamically generated barcode image within your template, perform the following steps:

* Add a ***Textbox*** to your template at the required place.
* Set standard settings for the textbox.
* Specify a **`barcode`** tag within this textbox using the following syntax:

```C#
<<barcode [barcodeText] -barcodeType>>
```

Font settings that are used to render barcode image, including font name, size, style and color, are derived from the font setting of the corresponding **`barcode`** tag. Similarly, the barcode text alignment options are derived from the tag's text alignment options. The background color of the barcode image is derived from the solid fill of the textbox containing the tag.

You can scale barcode symbols of a barcode image specifying the **`scale`** attribute as follows:

```C#
<<barcode [barcodeText] -barcodeType scale="scalingFactor">>
```

A **`scale`** attribute affects the width and height of a 2D barcode symbol and the width of a linear barcode symbol. The `scalingFactor` value represents the percentage of barcode symbol scaling.  

You can also set the height of a barcode image applying the **`barHeight`** attribute as follows:

```C#
<<barcode [barcodeText] -barcodeType barHeight="height">>
```

The `height` value specifies the percentage of the overall barcode image height.

For example, to set the height of a barcode symbol equal to two-thirds of its overall barcode image height, you can use the following barcode tag:

```C#
<<barcode ["30734690"] -codabar barHeight="67">>
```

### Setting a Barcode Type

You can specify a barcode type with a switch within a **`barcode`** tag declaration.

The following example shows how you can dynamically generate a barcode image of a ***CODABAR*** type:

```C#
<<barcode ["736192"] -codabar>>
```

The result would look like as follows:

![Barcode Image Example](/assembly/images/working-with-other-elements/barcode.png)

A list of supported barcode types is presented below:

| Barcode Type | Description |
| --- | --- |
| codabar | CODABAR Barcode |
| code11 | CODE 11 barcode |
| code39S | Standard CODE 39 barcode |
| code39E | Extended CODE 39 barcode |
| code93S | Standard CODE 93 barcode |
| code93E | Extended CODE 93 barcode |
| code128 | CODE 128 barcode |
| code128GS1 | GS1 CODE 128 barcode specification. The barcode text must contain parentheses for A |
| ean8 | EAN-8 barcode |
| ean13 | EAN-13 barcode |
| ean14 | EAN-14 barcode |
| scc14 | SCC-14 barcode |
| sscc18 | SSCC-18 barcode |
| upca | UPC-A barcode |
| upce | UPC-E barcode |
| isbn | ISBN barcode |
| issn | ISSN barcode |
| ismn | ISMN barcode |
| stf | Standard 2 of 5 barcode |
| itf | Interleaved 2 of 5 barcode |
| mtf | Matrix 2 of 5 barcode |
| ip25 | Italian Post 25 barcode |
| iatatf | IATA 2 of 5 barcode. IATA (International Air Transport Assosiation) uses this barcode for the management of air cargo |
| itf14 | ITF14 barcode |
| itf6 | ITF-6 barcode |
| msi | MSI Plessey barcode |
| vin | VIN (Vehicle Identification Number) barcode |
| dpi | Deutschen Post barcode, also known as Identcode, CodeIdentcode, German Postal 2 of 5 Identcode, Deutsche Post AG Identcode, Deutsche Frachtpost Identcode, Deutsche Post AG (DHL) |
| dpl | Deutsche Post Leitcode barcode, also known as German Postal 2 of 5 Leitcode, CodeLeitcode, Leitcode, Deutsche Post AG (DHL) |
| opc | OPC (Optical Product Code) barcode, also known as VCA barcode, VCA OPC, Vision Council of America OPC barcode |
| pzn | PZN barcode, also known as Pharma Zentral Nummer, Pharmazentralnummer |
| code16K | Code 16K barcode |
| pharmacode | Represents Pharmacode barcode, also known as Code32 |
| dm | DataMatrix barcode |
| qr | QR Code barcode |
| aztec | Aztec barcode |
| pdf417 | Pdf417 barcode |
| macroPdf417 | MacroPdf417 barcode |
| dmGS1 | DataMatrix barcode with GS1 string format |
| microPdf417 | MicroPdf417 barcode |
| qrGS1 | QR barcode with GS1 string format |
| maxiCode | MaxiCode barcode |
| dotCode | DotCode barcode |
| ap | Australia Post Customer barcode |
| postnet | Postnet barcode |
| planet | Planet barcode |
| oneCode | USPS OneCode barcode |
| rm4scc | RM4SCC barcode. RM4SCC (Royal Mail 4-state Customer Code) is used for automated mail sort process in UK |
| databarOD | Databar omni-directional barcode |
| databarT | Databar truncated barcode |
| databarL | Databar limited barcode |
| databarE | Databar expanded barcode |
| databarES | Databar expanded stacked barcode |
| databarS | Databar stacked barcode |
| databarSOD | Databar stacked omni-directional barcode |
| sp | Singapore Post barcode |
| ape | Australian Post Domestic eParcel barcode |
| spp | Swiss Post Parcel barcode. Supported types: Domestic Mail, International Mail, Additional Services |
| patchCode | Patch code barcode |
| code32 | Code32 barcode |
| dltf | DataLogic 2 of 5 barcode |
| dkix | Dutch KIX barcode |
| codablockF | Codablock F barcode |
| codablockFGS1 | GS1 Codablock F barcode |

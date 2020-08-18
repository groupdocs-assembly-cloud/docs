---
id: "working-with-html"
url: "assembly/developer-guide/working-with-html"
title: "Working with Hyperlinks, Bookmarks, Checkboxes, Barcodes"
weight: 6
productName: "GroupDocs.Assembly Cloud"
description: "Working with Hyperlinks, Bookmarks, Checkboxes, Barcodes"
keywords: ""
---

1.  [Inserting a Hyperlink](#HInsertingaHyperlink)
    1.  [Inserting a Hyperlink for Word-Processing Documents and Emails](#HInsertingaHyperlinkforWord-ProcessingDocumentsandEmails)
    2.  [Inserting a Hyperlink for Spreadsheet Documents](#HInsertingaHyperlinkforSpreadsheetDocuments)
    3.  [Inserting a Hyperlink for Presentation documents](#HInsertingaHyperlinkforPresentationdocuments)
2.  [Inserting a Bookmark](#HInsertingaBookmark)
3.  [Setting Checkbox Values Dynamically](#HSettingCheckboxValuesDynamically)
4.  [Generating and Inserting a Barcode Image](#HGeneratingandInsertingaBarcodeImage)
    1.  [Scaling of Barcode Symbols](#HScalingofBarcodeSymbols)
    2.  [Setting Height of 1D Barcode Symbols](#HSettingHeightof1DBarcodeSymbols)
    3.  [Customizing Foreground and Background Colors](#HCustomizingForegroundandBackgroundColors)
    4.  [Customizing Font and Placement](#HCustomizingFontandPlacement)

This section describes template tags, used to generate and insert different types of elements, such as hyperlinks, bookmarks, checkboxes, barcodes into reports dynamically.

## Inserting a Hyperlink

You can insert hyperlinks to different types of documents: word-processing documents and emails, spreadsheet and presentation documents. The following subsections show some tag syntax differences, applied to each document type.

### Inserting a Hyperlink for Word-Processing Documents and Emails

You can also insert links to bookmarks to your reports dynamically using ***link*** tags. The syntax of a ***link*** tag is defined as follows:

<<link \[uri\_or\_bookmark\_expression\]\[display\_text\_expression\]>>

Here, ***uri\_or\_bookmark\_expression*** defines URI or the name of a bookmark within the same document for a hyperlink to be inserted dynamically. This expression is mandatory and must return a non-empty value.

In turn, ***display\_text\_expression*** defines text to be displayed for the hyperlink. This expression is optional. If it is omitted or returns an empty value, then during runtime, a value of **uri\_or\_bookmark\_expression** is used as display text as well.

While building a report, ***uri\_or\_bookmark\_expression*** and ***display\_text\_expression*** are evaluated and their results are used to construct a hyperlink that replaces the corresponding ***link*** tag then. If ***uri\_or\_bookmark\_expression*** returns the name of a bookmark in the same document, then the hyperlink navigates to the bookmark. Otherwise, the hyperlink navigates to a corresponding external resource.

A ***link*** tag cannot be used within a chart.

### Inserting a Hyperlink for Spreadsheet Documents

For spreadsheet documents, the behavior of link tags is different.

If an expression defined within a link tag is evaluated to a cell or cell range reference during runtime, then the tag is replaced with a link to the corresponding cell or cell range.

The following table describes supported formats of cell and cell range references:

| Description | Format | Example |
| --- | --- | --- |
| Reference to a cell within the same worksheet | cell\_name | A1 |
| Reference to a cell in another worksheet | worksheet\_name!cell\_name | Sheet1!A1 |
| Reference to a cell range within the same worksheet | start\_cell\_name:end\_cell\_name | A1:B2 |
| Reference to a cell range in another worksheet | worksheet\_name!start\_cell\_name:end\_cell\_name | Sheet1!A1:B2 |

The following example demonstrates how to insert a link to cell ***A1***:

<<link \["A1"\] \["Home"\]>>

### Inserting a Hyperlink for Presentation documents

For Presentation documents, the behavior of ***link*** tags is different.

If an expression defined within a ***link*** tag is evaluated to a “***SlideN***” value, where ***N*** is a one-based index of a slide within the same Presentation document, then the tag is replaced with a link to the corresponding slide during run-time.

The following example demonstrates how to insert a link to the first slide:

<<link \["Slide1"\] \["Home"\]>>

## Inserting a Bookmark

You can insert bookmarks to your Word-processing documents and emails with HTML and RTF bodies dynamically using ***bookmark*** tags. The syntax of a ***bookmark*** tag is defined as follows:

<<bookmark \[bookmark\_expression\]>>  
bookmarked\_content  
<</bookmark>>

Here, **bookmark\_expression** defines the name of a bookmark to be inserted during run-time. This expression is mandatory and must return a non-empty value. While building a report, **bookmark\_expression** is evaluated and its result is used to construct a bookmark start and end that replace corresponding opening and closing ***bookmark*** tags respectively.

A bookmark tag cannot be used within a chart.

## Setting Checkbox Values Dynamically

You can set checkbox values to either checked or unchecked in your Word-based documents dynamically by taking the following steps:

1.  Add a checkbox content control to your template at a place where you want it to appear in a result document.
2.  By editing content control properties, add a ***check*** tag to the title of the checkbox content control using the following syntax.

<<check \[conditional\_expression\]>>

Here, ***conditional\_expression*** defines a condition upon which the value of the checkbox content control is to be set to checked. The conditional expression must return a boolean value.

## Generating and Inserting a Barcode Image

You can generate and insert barcode images to your documents dynamically using ***barcode*** tags. To declare a dynamically generated barcode image within your template, perform the following steps:

*   Add a textbox to your template at the place where you want a barcode image to be inserted.
*   Set common image attributes such as size and others for the textbox, making the textbox look like a barcode image without bars and text.
*   Specify a barcode tag within the textbox using the following syntax:

<<barcode \[barcode\_expression\] -barcode\_type>>

The following example shows how you can dynamically generate a barcode image:

<<barcode \["736192"\] -codabar>>

The result would look like as follows:

![https://github.com/groupdocs-assembly/GroupDocs.Assembly-for-.NET/blob/master/Examples/Data/Screenshots/Barcode.png?raw=true](https://github.com/groupdocs-assembly/GroupDocs.Assembly-for-.NET/blob/master/Examples/Data/Screenshots/Barcode.png?raw=true)

During run-time, an expression declared within a barcode tag is evaluated, its value is encoded using the specified barcode type, and the tag’s containing textbox is filled with a corresponding barcode image.

To specify a barcode type within a barcode tag, you can use one of the predefined identifiers described in the following table:

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

### Scaling of Barcode Symbols

You can scale barcode symbols of dynamically inserted barcode images specifying the ***scale*** attribute for a ***barcode*** tag as follows:

<<barcode \[barcode\_expression\] -barcode\_type scale="scaling\_hint">>

A ***scale*** attribute affects the width and height of a 2D barcode symbol and the width of a 1D barcode symbol. The value of a ***scale*** attribute represents the percent of barcode symbol scaling.  
The value of a ***scale*** attribute, however, is just a hint. That is, actual scaling of a barcode symbol can be not precisely equal to the specified one. The reason is that scaling can damage a barcode symbol in a way it to become unreadable by barcode scanners. That is why, the engine calculates actual scaling not to bring such a damage trying to be as close to the specified scaling as possible at the same time.

### Setting Height of 1D Barcode Symbols

The height of a 1D barcode symbol is not affected by the scale attribute of the corresponding ***barcode*** tag. However, you can set the height applying the ***barHeight*** attribute as follows:

<<barcode \[barcode\_expression\] -barcode\_type barHeight="height">>

The value of a ***barHeight*** attribute specifies the percent of the overall barcode image height. That is, for example, to set the height of a barcode symbol equal to two-thirds of its overall barcode image height, you can use the following barcode tag:

<<barcode \["736192"\] -codabar barHeight="67">>

### Customizing Foreground and Background Colors

The fore color of a dynamically inserted barcode image is used to render the barcode’s symbol and text. This color is derived from the font of the corresponding ***barcode*** tag. The background color of the image is derived from the solid fill of the textbox containing the tag.

### Customizing Font and Placement

The font used to render barcode text of a dynamically inserted barcode image derives the following attributes from the font of the corresponding ***barcode*** tag:

*   Name
*   Size
*   Style (bold and italic)
*   Color

The placement of barcode text of a dynamically inserted barcode image – leftward, rightward, or centered – is defined by text alignment of the corresponding barcode tag.

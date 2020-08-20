---
id: "product-overview"
url: "assembly/getting-started/product-overview"
title: "Product Overview"
weight: 1
productName: "GroupDocs.Assembly Cloud"
description: "Product Overview"
keywords: ""
---

1. [Report Generation vs Document Automation]({{< param url >}}//#report-generation-vs-document-automation)
2. [What is GroupDocs Assembly Cloud]({{< param url >}}//#what-is-groupdocs-assembly-cloud)
3. [Supported Reporting Features]({{< param url >}}//#supported-reporting-features)
4. [Supported File Formats]({{< param url >}}//#supported-file-formats)
5. [Supported Data Sources]({{< param url >}}//#supported-data-sources)
6. [Security Compliance]({{< param url >}}//#security-compliance)
7. [Software Requirements]({{< param url >}}//#software-requirements)
8. [Available SDKs]({{< param url >}}//#available-sdks)
9. [Related Resources]({{< param url >}}//#related-resources)
    * [API Explorer]({{< param url >}}//#api-explorer)
    * [Free Online Document Assembly App]({{< param url >}}//#free-online-document-assembly-app)
    * [Document Assembly Cloud GitHub Repository]({{< param url >}}//#document-assembly-cloud-github-repository)
    * [On-Premise Document Assembly SDKs]({{< param url >}}//#on-premise-document-assembly-sdks)

---

In the last years, [Report Generation](https://en.wikipedia.org/wiki/Report_generator) and [Document Automation](https://en.wikipedia.org/wiki/Document_automation) solutions have been gaining importance very fast. Their significance is increasing because of the opportunities for document-oriented knowledge reuse, which these technologies provide, promote and strengthen.

Just about any modern company has office files to automate, and the possibility to assemble and deploy business-critical documents in a reliable, secure, transparent manner and at the right time, is a vital component to successful business expansion. Implementation of Document Automation and Report Generation solutions additionally contributes to substantial financial savings, resulting from the reduction of manual data entry, human errors, proof-reading and verification processes, paperwork and printing equipment handling.

For all these reasons, Report Generation & Document Automation are the important parts of modern software design, targeting to meet the client's customized needs and provide him with analytical tools necessary for integrated assessment.

## Report Generation vs Document Automation

Both Report Generation and Document Automation software serve one purpose – create documents with no user interaction using templates and external data sources. However, there are a number of differences between them. Generally, Document Automation solutions tend to be more lightweight, whereas Report Generation solutions are more powerful. In terms of template design, Document Automation is mostly oriented on users with advanced text editor skills, whereas Report Generation is oriented on IT pros.

To undertake those challenges and help our customers to seamlessly fulfill Document Automation and Report Generation tasks of various volume and complexity level, GroupDocs team has developed an enterprise-ready Assembly Cloud API with a powerful set of open-source SDKs for nearly all mainstream programming languages.

## What is GroupDocs Assembly Cloud

Assembly Cloud is a Report Generation & Document Automation [REST API](https://apireference.groupdocs.cloud/assembly/), designed to create customized Microsoft Word and OpenOffice documents, Excel spreadsheets, PowerPoint presentations, PDFs and files of many other types based on a powerful Reporting Engine and reusable document template management.

A common template usually contains a portion of static content, combined with special tags, which are designed to generate separate parts of the document dynamically. This combination allows building reports with any complex structure and formatting, for example, sales proposals, orders, contracts, shipment reports, invoices, inventories.

Assembly Cloud is also a powerful [Mail Merge](https://en.wikipedia.org/wiki/Mail_merge) automation alternative, that generates personalized emails on the fly.

## Supported Reporting Features

The Reporting Engine, also known as the Report Generator, is the central functional element of our cloud-based Document Assembly technology, which allows customers to perform the following actions:

* Dynamically generate and insert lists, tables, charts, barcodes, hyperlinks and bookmarks.
* Manipulate data using sequential data operations.
* Perform flexible data formatting for numeric, text & date-time elements.
* Use conditional blocks, which represent a set of alternative template options, bound with conditional expressions.
* Define variables used to calculate computationally expensive values just once and access them multiple times.
* Calculate formula while assembling spreadsheet documents.
* Assign attributes to the email message body and build email message attachments dynamically.
* And much more.

## Supported File Formats

GroupDocs.Assembly Cloud API allows you to generate documents in popular Microsoft Word, Excel, PowerPoint, Outlook, OpenOffice, Adobe Acrobat, Web, Image and many other formats:

| File Type | File Extensions |
| --- | --- |
| Microsoft Word | DOCX, DOC, DOT, DOTX, DOTM, DOCM, RTF, WordprocessingML |
| Microsoft Excel | XLSX, XLS, XLSM, XLSB, XLT, XLTM, XLTX, SpreadsheetML |
| Microsoft PowerPoint | PPTX, PPT, PPTM, PPS, PPSX, PPSM, POT, POTX, POTM |
| Microsoft Outlook | MSG, EML, EMLX |
| OpenOffice | ODT, OTT, ODS, ODP, OTP |
| Adobe | PDF |
| Web | HTML, MHTML, MHT, MD, TXT |
| Printing Language | PCL, PS, XPS, OXPS |
| Vector Images | SVG, EMF |
| Bitmap Images | PNG, JPEG, GIF, TIFF, BMP |
| Other Formats | XAML, EPUB |

Have a look at the detailed list of [Supported File Formats and Conversions](/assembly/getting-started/file-formats/).

## Supported Data Sources

The following types of data sources are currently supported:

* [XML](https://en.wikipedia.org/wiki/XML) - eXtensible Markup Language format.
* [JSON](https://en.wikipedia.org/wiki/JSON) - JavaScript Object Notation format.

## Security Compliance

GroupDocs Assembly Cloud API fully complies with the industry security standards: data transmission is carried out under the JWT authentication that excludes the possibility of snatching information by third parties. For this purpose, you must acquire an ***App SID*** and ***App KEY*** identifiers to authenticate API requests before being able to use the Reporting Engine functionality.

Have a look at the ["Authenticating API Requests"](https://wiki.groupdocs.cloud/gdtotalcloud/getting-started/overview-rest-api/authenticating-api-requests/) article to gain a better understanding of the underlying security layer.

## Software Requirements

GroupDocs Assembly Cloud does not require any external software or third-party tools to be installed.

## Available SDKs

Check out our [GitHub repository](https://github.com/groupdocs-assembly-cloud/) for a complete list of GroupDocs.Assembly SDKs along with working examples. At the moment following SDKs are available:

| Language or Platform | Source Codes | Package |
| --- | --- | --- |
| .NET | [Sources on GitHub](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-dotnet) | [NuGet Package](https://www.nuget.org/packages/GroupDocs.Assembly-Cloud/) |
| Java | [Sources on GitHub](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-java) | [Java Package](https://repository.groupdocs.cloud/webapp/#/artifacts/browse/tree/General/repo/com/groupdocs/groupdocs-assembly-cloud) |
| PHP | [Sources on GitHub](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-php) | [Composer Package](https://packagist.org/packages/groupdocscloud/groupdocs-assembly-cloud) |
| C++ | [Sources on GitHub](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-cpp) | not provided |
| Node.js | [Sources on GitHub](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-node) | [Npm Package](https://www.npmjs.com/package/groupdocs-assembly-cloud) |
| Ruby | [Sources on GitHub](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-ruby) | [RubyGem](https://rubygems.org/gems/groupdocs_assembly_cloud) |
| Python | [Sources on GitHub](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-python) | [PyPI Package](https://pypi.org/project/groupdocs-assembly-cloud/) |
| Swift | [Sources on GitHub](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-swift) | not provided |
| Go | [Sources on GitHub](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-go) | not provided |

## Related Resources

### API Explorer

[API Explorer](https://apireference.groupdocs.cloud/assembly/) is a collection of ***Swagger*** neatly categorized documentation for the GroupDocs Cloud APIs. It allows end developers to find, visualize and effortlessly interact with API’s resources and endpoints without having any of the implementation logic in place.

### Free Online Document Assembly App

You can try our free online [Document Assembly App](https://products.groupdocs.app/assembly/total). Just upload your document template and data source files, select the required options, click the _“ASSEMBLE NOW”_ button and get the resulting output in a few seconds.

### Document Assembly Cloud GitHub Repository

Check out our [GitHub repository](https://github.com/groupdocs-assembly-cloud/) for the latest versions of Assembly Cloud SDKs.

### On-Premise Document Assembly SDKs

We also provide an on-premise family of Assembly SDKs for .NET- and Java-based integrated development:

* [Assembly for .NET](https://products.groupdocs.com/assembly/net) - a native .NET library, targeting ASP NET, WinForms, WPF, WCF and other types of .NET-applications.
* [Assembly for Java](https://products.groupdocs.com/assembly/java) - a native Java library, targeting web, desktop and other types of Java SE/EE applications.

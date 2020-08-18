---
id: "quick-start"
url: "assembly/getting-started/quick-start"
title: "Quick Start"
weight: 4
productName: "GroupDocs.Assembly Cloud"
description: "Quick Start"
keywords: ""
---

1.  [Obtaining Security Credentials to Authorize API Requests](#HObtainingSecurityCredentialstoAuthorizeAPIRequests)
2.  [Generating a Report in Three Steps](#HGeneratingaReportinThreeSteps)
    1.  [Designing a Document Template](#HDesigningaDocumentTemplate)
    2.  [Designing a Data Source](#HDesigningaDataSource)
    3.  [Writing and Executing a Program Code](#HWritingandExecutingaProgramCode)
        1.  [.NET Example Code](#H.NETExampleCode)
        2.  [Java Example Code](#HJavaExampleCode)
        3.  [PHP Example Code](#HPHPExampleCode)
        4.  [C++ Example Code](#HC2B2BExampleCode)
        5.  [Node.js Example Code](#HNode.jsExampleCode)
        6.  [Ruby Example Code](#HRubyExampleCode)
        7.  [Python Example Code](#HPythonExampleCode)
        8.  [Swift Example Code](#HSwiftExampleCode)
        9.  [Go Example Code](#HGoExampleCode)

This section is intended to help developers start working with the chosen SDK quickly. You will learn how to obtain security credentials to authorize your requests to Assembly Cloud API and proceed with tree steps of the report generation process to demonstrate some major features and functionalities. The following code samples illustrate, that the Reporting Cloud API can be integrated into your application with just several lines of code in almost any mainstream programming language.

## Obtaining Security Credentials to Authorize API Requests

To start using Assembly Cloud API you need to set up authorization using OAuth 2.0.

Please, follow the instructions below to get your **App Key** and **App SID** security credentials:

1.  Log into the [GroupDocs Cloud Dashboard](https://dashboard.groupdocs.cloud/#/).
2.  Click on** My Apps** tab. Each App has its own **App Key** and **App SID** credentials.
3.  A default App already exists under the **Manage My Apps** tab, and you can simply use it.
4.  Click on the lock icon to access your App Key.
5.  If you want to create a new application, click on the **Create New App** button.
6.  Enter details for the new App and then click on the **Save** button.
7.  A new App has been created with a storage quota of 500 MB. You can view the newly created App under **My Apps** tab.

## Generating a Report in Three Steps

Irrespective of the scale and type of document automation you are planning to employ, there are three necessary steps of the report generation process:

1.  Document template design.
2.  Data source design.
3.  Writing and executing a program code.

For demonstration purposes, we'll use a prepared set of materials.

### Designing a Document Template

First, you need to create a document template with tags and expressions, also known as document generation rules, that regulate the document's structure, format and content variations. You can create a new document template from the ground up or quickly turn your existing document into the template.

The following document template [example](/downloadrev/groupdocs-assembly-cloud-product-family/getting-started/quick-start/WebHome/template.docx?rev=1.1) demonstrates some typical tags, you can use to generate tables and diagrams dynamically in your reports:

![image-20200816162653-1.png](/downloadrev/groupdocs-assembly-cloud-product-family/getting-started/quick-start/WebHome/image-20200816162653-1.png?rev=1.1&width=728&height=569)

### Designing a Data Source

At the next step, you need to create a JSON or XML data source with a correct structure and data. Уou can prepare it by extracting and serializing your business objects to JSON or XML formats. Since business data is often fragmented and distributed in a variety of formats, creating the appropriate information processing subsystem is often required.

The following [example](/downloadrev/groupdocs-assembly-cloud-product-family/getting-started/quick-start/WebHome/data.json?rev=1.1) demonstrates a JSON data source, that is compatible with a previous document template:

| JSON Data Source |
| --- |
| {  
 "client": "Mr.Brown",  
 "address": "St.Road 82",  
 "orders": \[  
    {  
     "date": "2015-03-05",  
     "products": \[  
        { "name": "Monitor", "price": 2, "quantity": 2},  
        { "name": "Computer", "price": 3, "quantity": 1}  
      \]  
    },  
    {  
     "date": "2015-03-15",  
     "products": \[  
        { "name": "Monitor", "price": 2, "quantity": 1},  
        { "name": "Printer", "price": 1, "quantity": 2},  
        { "name": "Computer", "price": 3, "quantity": 1}  
      \]  
    }  
  \]  
} |

### Writing and Executing a Program Code

Finally, you need to use a program code to pass a document template with a data source to the Reporting Engine to bind them together and produce a final document, which would look as follows:

![image-20200816160131-1.png](/downloadrev/groupdocs-assembly-cloud-product-family/getting-started/quick-start/WebHome/image-20200816160131-1.png?rev=1.1&width=724&height=640)

Below you can find code samples for different SDKs. Use the **App SID** and **App Key** from the API app client you created and replace them in the corresponding lines of code.

#### .NET Example Code

A C# code sample is provided below:

#### Java Example Code

A Java code sample is provided below:

#### PHP Example Code

A PHP code sample is provided below:

#### C++ Example Code

A C++ code sample is provided below:

#### Node.js Example Code

A Node.js code sample is provided below:

#### Ruby Example Code

A Ruby code sample is provided below:

#### Python Example Code

A Python code sample is provided below:

import os  
from groupdocsassemblycloud import AssemblyApi, AssembleOptions, TemplateFileInfo  
from groupdocsassemblycloud.models.requests import AssembleDocumentRequest, UploadFileRequest  
  
app\_sid \= '####-####-####-####-####'  
app\_key \= '##################'  
assembly\_api \= AssemblyApi(app\_sid, app\_key, 'https://api.groupdocs.cloud')  
  
\# Upload the template  
with open('Template.docx', 'rb') as template\_file:  
 upload\_request \= UploadFileRequest(template\_file, path\='/')  
 assembly\_api.upload\_file(upload\_request)  
  
with open('data.json') as f:  
 data \= f.read()  
template\_file\_info \= TemplateFileInfo(template\_file)  
options \= AssembleOptions(template\_file, save\_format\='docx', report\_data\=data)  
request \= AssembleDocumentRequest(options)  
result \= assembly\_api.assemble\_document(request)

#### Swift Example Code

A Swift code sample is provided below:

#### Go Example Code

A Golang code sample is provided below:

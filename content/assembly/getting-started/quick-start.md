---
id: "quick-start"
url: "assembly/getting-started/quick-start"
title: "Quick Start"
weight: 4
productName: "GroupDocs.Assembly Cloud"
description: "Quick Start"
keywords: ""
---

1. [Obtaining Security Credentials to Authorize API Requests](/assembly/getting-started/quick-start/#obtaining-security-credentials-to-authorize-api-requests)
2. [Generating a Report in Three Steps](/assembly/getting-started/quick-start/#generating-a-report-in-three-steps)
    1. [Designing a Document Template](/assembly/getting-started/quick-start/#designing-a-document-template)
    2. [Designing a Data Source](/assembly/getting-started/quick-start/#designing-a-data-source)
    3. [Writing and Executing a Program Code](/assembly/getting-started/quick-start/#writing-and-executing-a-program-code)
        * [Python Code Sample](/assembly/getting-started/quick-start/#python-code-sample)

This section is intended to help developers start working with the chosen SDK quickly. You will learn how to obtain security credentials to authorize your requests to Assembly Cloud API and proceed with tree steps of the report generation process to demonstrate some major features and functionalities. The following code samples illustrate, that the Reporting Cloud API can be integrated into your application with just several lines of code in almost any mainstream programming language.

## Obtaining Security Credentials to Authorize API Requests

To start using Assembly Cloud API you need to set up authorization using OAuth 2.0.

Please, follow the instructions below to get your ***App Key** and ***App SID*** security credentials:

1. Log into the [GroupDocs Cloud Dashboard](https://dashboard.groupdocs.cloud/#/).
2. Click on **_My Apps_** tab. Each App has its own ***App Key*** and ***App SID*** credentials.
3. A default App already exists under the ***Manage My Apps*** tab, and you can simply use it.
4. Click on the lock icon to access your ***App Key***.
5. If you want to create a new application, click on the ***Create New App*** button.
6. Enter details for the new App and then click on the ***Save*** button.
7. A new App has been created with a storage quota of 500 MB. You can view the newly created App under ***My Apps*** tab.

## Generating a Report in Three Steps

Irrespective of the scale and type of document automation you are planning to employ, there are three necessary steps of the report generation process:

1. Document template design.
2. Data source design.
3. Writing and executing a program code.

For demonstration purposes, we'll use a prepared set of materials.

### Designing a Document Template

First, you need to create a document template with tags and expressions, also known as document generation rules, that regulate the document's structure, format and content variations. You can create a new document template from the ground up or quickly turn your existing document into the template.

The following document template example demonstrates some typical tags, you can use to generate tables and diagrams dynamically in your reports:

![Template Example 1](/assembly/images/getting-started/template_1.png)

### Designing a Data Source

At the next step, you need to create a JSON or XML data source with a correct structure and data. Уou can prepare it by extracting and serializing your business objects to JSON or XML formats. Since business data is often fragmented and distributed in a variety of formats, creating the appropriate information processing subsystem is often required.

The following example demonstrates a JSON data source, that is compatible with a previous document template:

<table>
<thead>
<tr>
<th>JSON Data Source<th>
</tr>
</thead>
<tbody>
<tr>
<td>

```JSON
{
 "client": "Mr.Brown",
 "address": "St.Road 82",
 "orders": [
    {
     "date": "2015-03-05",
     "products": [
        { "name": "Monitor", "price": 2, "quantity": 2},
        { "name": "Computer", "price": 3, "quantity": 1}
      ]
    },
    {
     "date": "2015-03-15",
     "products": [
        { "name": "Monitor", "price": 2, "quantity": 1},
        { "name": "Printer", "price": 1, "quantity": 2},
        { "name": "Computer", "price": 3, "quantity": 1}
      ]
    }
  ]
}
```

</td>
</tr>
</tbody>
</table>

### Writing and Executing a Program Code

Finally, you need to use a program code to pass a document template with a data source to the Reporting Engine to bind them together and produce a final document, which would look as follows:

![The Output of Example 1](/assembly/images/getting-started/result_1.png)

Below you can find code samples for different SDKs. Use the ***App SID*** and ***App Key*** from the API app client you created and replace them in the corresponding code lines.

#### Python Code Sample

A Python code sample is provided below:

```Python
import os
from groupdocsassemblycloud import AssemblyApi, AssembleOptions, TemplateFileInfo
from groupdocsassemblycloud.models.requests import AssembleDocumentRequest, UploadFileRequest

app_sid = '####-####-####-####-####'
app_key = '##################'
assembly_api = AssemblyApi(app_sid, app_key, 'https://api.groupdocs.cloud')

# Upload the template
with open('Template.docx', 'rb') as template_file:
 upload_request = UploadFileRequest(template_file, path='/')
 assembly_api.upload_file(upload_request)

with open('data.json') as f:
 data = f.read()
template_file_info = TemplateFileInfo(template_file)
options = AssembleOptions(template_file, save_format='docx', report_data=data)
request = AssembleDocumentRequest(options)
result = assembly_api.assemble_document(request)
```

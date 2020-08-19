---
id: "status-and-error-codes"
url: "assembly/getting-started/status-and-error-codes"
title: "Status and Error Codes"
weight: 5
productName: "GroupDocs.Assembly Cloud"
description: "Status and Error Codes"
keywords: ""
---

This section introduces Assembly Cloud specific status & error codes. The request/response data is transmitted in JSON format.

The following table contains a list of status and error codes, that you can receive while interacting with Assembly Cloud API:

<table><thead><tr valign="top"><th>Status Code</th><th>HTTP Status Code Description</th><th>Error Code</th><th>Error Code Description</th></tr></thead><tbody><tr valign="top"><td><b><code>2xx</code></b></td><td colspan="3">This group of status codes indicates the action, requested by the client, was received and accepted</td></tr><tr valign="top"><td><code>200</code></td><td colspan="3">Standard response for successful request</td></tr><tr valign="top"><td><code>201</code></td><td colspan="3">The request has been fulfilled and a new resource was created</td></tr><tr valign="top"><td><code>204</code></td><td colspan="3"><div><p>The request has been fulfilled and a resource was removed</p></div></td></tr><tr valign="top"><td><b><code>4xx</codee></b></td><td colspan="3">This group of status code indicates an error, that seems to have been caused by the client</td></tr><tr valign="top"><td rowspan="4"><code>400</code></td><td rowspan="4"><div><p>Failed to handle the request due to invalid parameters or missing resources</p></div></td><td><code>FailedToReadFile</code></td><td>Could not read the file (the file can be corrupted or damaged)</td></tr><tr valign="top"><td><code>UnsupportedFileType</code></td><td>That the provided file has a format, that is not supported</td></tr><tr valign="top"><td><code>MissingFileInfo</code></td><td>The parameter 'FileInfo' was not specified</td></tr><tr valign="top"><td><code>MissingParameters</code></td><td>The request parameters are missing or have incorrect format</td></tr><tr valign="top"><td rowspan="2"><code>401</code></td><td rowspan="3"><div><p>Authorization failed. The server is refusing action</p></div></td><td><code>MissingPassword</code></td><td>The password was not provided</td></tr><tr valign="top"><td rowspan="2"><code>IncorrectPassword</code></td><td rowspan="2">The provided password is incorrect</td></tr><tr valign="top"><td><code>403</code></td></tr><tr valign="top"><td rowspan="3"><code>404</code></td><td rowspan="3">The requested resource could not be found</td><td><code>FileNotFound</code></td><td>The file can not be found</td></tr><tr valign="top"><td><code>AttachmentNotFound</code></td><td>The attachment can not be found</td></tr><tr valign="top"><td><code>FontsPathNotFound</code></td><td>The specified fonts path can not be found</td></tr><tr valign="top"><td><code>405</code></td><td colspan="3">A request method is not supported for the requested resource</td></tr><tr valign="top"><td><b><code>5xx</code></b></td><td colspan="3"><strong>This class of status code is intended for situations in which the server is incapable of performing the request</strong></td></tr><tr valign="top"><td><code>500</code></td><td colspan="3"><div><p>Internal server error occurred while processing the request</p></div></td></tr></tbody></table>

## Error Response Example

If the corresponding with the identifier file can not be found in the Cloud Storage, the Assembly Cloud Service reply would look as follows:

```HTML
Status: 404 Not Found
```

```JSON
{  
 "error": {  
   "code": "FileNotFound",  
   "message": "Can't find file with given name 'document.doc' and folder 'My Documents'."  
  }  
}
```

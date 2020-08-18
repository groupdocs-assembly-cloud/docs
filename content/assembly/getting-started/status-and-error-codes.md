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

| HTTPStatus Code | HTTP Status Code Description | Error Code | Error Code Description |
| --- | --- | --- | --- |
| 2xx | This group of status codes indicates the action, requested by the client, was received and accepted |
| 
200

 | Standard response for successful request |
| 

201

 | The request has been fulfilled and a new resource was created |
| 

204

 | 

The request has been fulfilled and a resource was removed

 |
| **4xx** | This group of status code indicates an error, that seems to have been caused by the client

 |
| 

400

 | 

Failed to handle the request due to invalid parameters or missing resources

 | FailedToReadFile  | Could not read the file (the file can be corrupted or damaged) |
| UnsupportedFileType  | That the provided file has a format, that is not supported |
| MissingFileInfo | The parameter 'FileInfo' was not specified |
| MissingParameters | The request parameters are missing or have incorrect format |
| 

401

 | 

Authorization failed. The server is refusing action

 | MissingPassword | The password was not provided |
| IncorrectPassword | The provided password is incorrect |
| 403 |
| 

404

 | The requested resource could not be found | FileNotFound | The file can not be found |
| AttachmentNotFound | The attachment can not be found |
| FontsPathNotFound | The specified fonts path can not be found |
| 

405

 | A request method is not supported for the requested resource |
| **5xx** | **This class of status code is intended for situations in which the server is incapable of performing the request** |
| 

500

 | 

Internal server error occurred while processing the request

 |

## Error Response Example

If the corresponding with the identifier file can not be found in the Cloud Storage, the Assembly Cloud Service reply would look as follows::

Status: 404 Not Found

{  
 "error": {  
   "code": "FileNotFound",  
   "message": "Can't find file with given name 'document.doc' and folder 'My Documents'."  
  }  
}

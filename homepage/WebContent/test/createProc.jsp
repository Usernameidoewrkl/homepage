<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%

    String upDir = "/test/storage";   
    String tempDir = "/test/temp";   
    
    upDir = application.getRealPath(upDir);
    tempDir = application.getRealPath(tempDir);
    
    UploadSave upload = new UploadSave(request, -1, -1, tempDir);
    

    String title = UploadSave.encode(upload.getParameter("title"));
    String content = UploadSave.encode(upload.getParameter("content"));
    String etc = UploadSave.encode(upload.getParameter("etc"));
    
    FileItem fileItem = upload.getFileItem("filename");
    int size = (int)fileItem.getSize();
    String filename = UploadSave.saveFile(fileItem, upDir);
    
    
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<div class="well well-Lg">

title        : <%=title %> <br>
content   : <%=content %> <br>
etc          : <%=etc %><br>
filename  : <%=filename %><br>
file size   : <%=size %> 


 </div>
</div>
</body> 
</html> 
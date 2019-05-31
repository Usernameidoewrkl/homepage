<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%  UploadSave upload = 
            new UploadSave(request, -1, -1, tempDir);

    String id = upload.getParameter("id");
    String oldfile = UploadSave.encode
    		    (upload.getParameter("oldfile"));
    
    FileItem fileItem = upload.getFileItem("fname");
    
    UploadSave.deleteFile(upDir, oldfile); //원본파일을 지움.
    String fname = UploadSave.saveFile(fileItem, upDir);
    
    Map map = new HashMap();
    map.put("id", id);
    map.put("fname", fname);
    
    boolean flag = dao.updateFile(map);
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function listM(){
    var url = "list.jsp";
    url += "?col=<%=request.getParameter("col")%>";
    url += "&word=<%=request.getParameter("word")%>";
    url += "&nowPage=<%=request.getParameter("nowPage")%>";
    
    location.href=url;
  }
  
  </script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">사진수정</h1>
<div class="well well-lg">
<%
           if(flag){
        	   out.print("사진수정을 성공했습니다");
           }else{
        	   out.print("사진수정을 실패했습니다");
           }
%>
<button class="btn btn-default" onclick="location.href='read.jsp?id=<%=id%>'">나의정보</button>
<button class="btn btn-default" onclick="history.back()">다시시도</button>
</div>
</div>
</body> 
</html>
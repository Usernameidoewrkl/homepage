<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_bbs.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"/>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<jsp:setProperty name="dto" property="*"/>
<% 
  
   boolean flag=dao.create(dto);

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
<div class="well well-lg">
<%
   if(flag){
	   out.print("게시글 등록을 완료했습니다.");
   }else{
	   out.print("게시글 등록에 실패했습니다.");
   }

%>
</div>
<button class="btn" type="button" onclick="location.href='./createForm.jsp'">다시등록</button>
<button class="btn" type="button" onclick="location.href='./list.jsp'">목록</button>
</div>
</body> 
</html>



 
<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); 
String id=(String)session.getAttribute("id");
String grade=(String)session.getAttribute("grade");
String str="기본 페이지";
if(id!=null && grade.equals("A")){
   str="관리자 페이지";
}
%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>기본 페이지</title>
  <meta charset="utf-8">
</head>
<body>
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3 style="color: white;">Column 1</h3>
      <img src="./images/xbox1.jpg" class="img-responsive img-thumbnail" >
    </div>
    <div class="col-sm-4">
      <h3 style="color: white;">Column 2</h3>
      <img src="./images/xbox2.jpg" class="img-responsive img-thumbnail" >
      
    </div>
    <div class="col-sm-4">
      <h3 style="color: white;">Column 3</h3>        
      <img src="./images/xbox3.jpg" class="img-responsive img-thumbnail" >
      
    </div>
  </div>
</div>

</body> 
</html> 
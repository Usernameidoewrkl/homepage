<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<% String root = request.getContextPath(); 
   String id = (String)session.getAttribute("id");
   String grade = (String)session.getAttribute("grade");
   
   String str ="기본페이지 입니다.";
   if(id!=null && !grade.equals("A")){
     str = "안녕하세요 "+id+"님!!";
   }else if(id!=null && grade.equals("A")){
     str = "관리자페이지 입니다.";
   }
   
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-image: url('<%=root %>/images/bg.jpg'); background-repeat: no-repeat; background-size: 2000px;"> 
<div class="container">
  <div class="page-header row">
   <div class="col-sm-14">
    <img src="<%=root %>/images/main.jpg" class="img-responsive img-thumbnail" alt="Cinque Terre" >
   </div>
   
   <div class="col-sm-8"><h1 style="color: white;">Homepage</h1><p style="color: white;"> <%=str %><p>
   </div>     
  </div>
  <ul class="nav nav-tabs">
    <li class="active"><a href="<%=root%>/index.jsp" >Home</a></li>
    
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: white;">게시판 <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="<%=root%>/bbs/createForm.jsp">생성</a></li>
        <li><a href="<%=root%>/bbs/list.jsp">목록</a></li>
      </ul>
    </li>
    
    <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: white;">방명록<span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="<%=root%>/guestbook/createForm.jsp">생성</a></li>
        <li><a href="<%=root%>/guestbook/list.jsp">목록</a></li>
      </ul>
    </li>
   
 <!-- <li><a href="<%=root %>/member/list.jsp">회원 목록<span class="caret"></span></a></li> -->
   <%if(id==null){ %>

  <li><a href="<%=root %>/member/agreement.jsp"style="color: white;"><span></span>회원가입</a></li>
  <li><a href="<%=root %>/member/loginForm.jsp"style="color: white;"><span></span>로그인</a>
  </form>
  <%}else if(id!=null && grade.equals("A")){ %>
  <li><a href="<%=root %>/admin/list.jsp" style="color: white;">회원 목록<span class="caret"></span></a></li>
  <li><a href="<%=root %>/member/logout.jsp" style="color: white;"><span></span>로그아웃</a>
  <%}else{ %>
  <li><a href="<%=root %>/member/read.jsp" style="color: white;"><span></span>나의정보</a></li>
  <li><a href="<%=root %>/member/updateForm.jsp" style="color: white;"><span></span>회원수정</a></li>
  <li><a href="<%=root %>/member/logout.jsp" style="color: white;"><span></span>로그아웃</a>
  <% } %>
  </li>
  </ul>
</div>
</body> 
</html> 
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_member.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
       String id = request.getParameter("id");
       String grade = (String)session.getAttribute("grade");

       if(id==null) {
    	   id = (String)session.getAttribute("id");
       }
           
       MemberDTO dto = dao.read(id);
%> 
 
<!DOCTYPE html> 
<html> 
<head>
  <title>회원정보</title>
  <meta charset="utf-8">
  <script type="text/javascript">
  function delM(){
    var url="deleteForm.jsp";
    url += "?id=<%=id%>";
    url += "&oldfile=<%=dto.getFname()%>";
    
    location.href=url
  }
  function listM(){
    var url = "list.jsp"
    url += "?id=<%=id%>";
    
    location.href = url;
  }
  
  function updateM(){
    var url = "updateForm.jsp"
    url += "?id=<%=id%>";
    
    location.href = url;
  }
  
  function updateFile(){
    var url = "updateFileForm.jsp"
    url += "?id=<%=id%>";
    url += "&oldfile=<%=dto.getFname()%>"
    
    location.href = url;
  }
  
  
  </script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10" style="color: white;"><%=dto.getMname() %>의 회원정보</h1>
<table class="table table-bordered">
<tr>
    <td colspan="2" >
    <img src="./storage/<%=dto.getFname() %>" class="img-rounded" 
    width="350px" height="350px">
</tr>

<tr>
    <th>아이디</th>
    <td><%=dto.getId() %></td>
</tr>

<tr>
    <th>성명</th>
    <td><%=dto.getMname() %></td>
</tr>
    
<tr>
    <th>전화번호</th>
    <td><%=dto.getTel() %></td>
</tr>
   
<tr>
    <th>이메일</th>
    <td><%=dto.getEmail() %></td>
</tr>
    
    <tr>
    <th>우편번호</th>
    <td><%=dto.getZipcode() %></td>
    </tr>
    
    <tr>
    <th>주소</th>
    <td><%=dto.getAddress1() %>(<%=dto.getAddress2() %>)</td>
    </tr>
    
    <tr>
    <th>직업</th>
    <td>직업코드:<%=dto.getJob() %>(<%=Utility.getCodeValue(dto.getJob()) %>)</td>
    </tr>
    
    <tr>
    <th>날짜</th>
    <td><%=dto.getMdate() %></td>
    </tr>
    
</table>
<div style="text-align: center">
<button class="btn btn-default" onclick="updateM()">정보수정</button>
<button class="btn btn-default" onclick="delM()">회원탈퇴</button>
<button class="btn btn-default" onclick="updateFile()">사진수정</button>
<button class="btn btn-default">패스워드 변경</button>
<% if(id!=null && grade.equals("A")){%>
<button class="btn btn-default" onclick="listM()">회원목록</button>
<% } %>
</div>
</div>
</body> 
</html> 
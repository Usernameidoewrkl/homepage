<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
String root = request.getContextPath();
    /*------쿠키설정 내용시작----------------------------*/
    String c_id= ""; //ID 저장 여부를 저장하는 변수, Y
    String c_id_val = ""; //ID값
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;
    
    if(cookies != null){
    	for(int i = 0; i < cookies.length; i++){
    		cookie = cookies[i];
    		
    		if(cookie.getName().equals("c_id")){
    			c_id = cookie.getValue(); //Y
    		}else if(cookie.getName().equals("c_id_val")){
    			c_id_val = cookie.getValue(); //user1...
    		}
    	}
    }
%> 
<!DOCTYPE html> 
<html> 
<head>
  <title>로그인</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">로그인</h1>
<form class="form-horizontal" 
      action="<%=root %>/member/loginProc.jsp"
      method="post"
      >

  <div class="form-group">
    <label class="control-label col-sm-2" for="id">아이디</label>
    <div class="col-sm-4">
      <input type="text" name="id" id="id" class="form-control" required="required" value='<%=c_id_val%>'>
    <%
    if (c_id.equals("Y")){  // id 저장 상태라면 
        %>   
          <input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장 
        <% 
        }else{ %> 
          <input type='checkbox' name='c_id' value='Y' > ID 저장 
        <% 
        } 
    %>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="passwd">비밀번호</label>
    <div class="col-sm-4">
    <input type="password" name="passwd" id="passwd" class="form-control" required="required">
    </div>    
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-8">
    <button class="btn btn-default">로그인</button>
    <button type="button" class="btn btn-default" onclick="location.href='agreement.jsp'">회원가입</button>
    <button type="button" class="btn btn-default">아이디 찾기</button>
    <button type="button" class="btn btn-default">비밀번호 찾기</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 
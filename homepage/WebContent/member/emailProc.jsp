<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_member.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<%
    String email = request.getParameter("email");

    boolean flag = dao.duplicateEmail(email);
 %>
<!DOCTYPE html>
<html>
<head>
    <title>Email 중복확인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
  function use(){
    opener.email.value='<%=email%>';
    self.close();
    
  }
  
  </script>
</head>
<body>
<div class="container">
<br><br>
<div class="well well-lg col-sm-offset-2 col-sm-7">
<br><br>
입력된 Email : <%=email %>는<br>
<%
		if (flag) {
			out.print("중복되어 사용할 수 없습니다.<br><br>");
		}else {
			out.print("사용 가능합니다.<br><br>");
			out.print("<button type='button' class='btn' onclick='use()'>사용</button>");
		}
%>
</div>

<div class="col-sm-offset-4 col-sm-5">
<button class="btn btn-default" type="button" onclick="history.back()">다시시도</button>
<button class="btn btn-default" type="button" onclick="window.close">닫기</button>
</div>
</div>
</body>
</html>

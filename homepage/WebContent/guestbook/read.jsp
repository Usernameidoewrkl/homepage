<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi_guestbook.jsp"%>
<jsp:useBean id="dao" class="guestbook.GuestBookDAO" />
<%
  int no = Integer.parseInt(request.getParameter("no"));
  GuestBookDTO dto = dao.read(no);
%>

<!DOCTYPE html>
<html>
<head>
<title>방명록 조회</title>
<meta charset="utf-8">
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
  <div class="container">
    <h2 style="color: white;">방명록 조회</h2>
    <div class="panel panel-default">
      <div class="panel-heading">이름</div>
      <div class="panel-body"><%=dto.getName()%></div>
      <div class="panel-heading">제목</div>
      <div class="panel-body"><%=dto.getTitle()%></div>
      <div class="panel-heading">내용</div>
      <div class="panel-body"><%=dto.getContent()%></div>
      <div class="panel-heading">성별</div>
      <div class="panel-body"><%=dto.getGender()%></div>
      <div class="panel-heading">분야</div>
      <div class="panel-body"><%=dto.getPartstr()%></div>
      <div class="panel-heading">수정일</div>
      <div class="panel-body"><%=dto.getRegdate()%></div>
    </div>
    <div>
      <button class="btn btn-default" type="button"
        onclick="location.href='./createForm.jsp'">등록</button>
      <button class="btn btn-default" type="button"
        onclick="location.href='./replyForm.jsp?no=<%=dto.getNo()%>'">답변</button>
      <button class="btn btn-default" type="button"
        onclick="location.href='./list.jsp'">목록</button>
    </div>
  </div>
</body>
</html>

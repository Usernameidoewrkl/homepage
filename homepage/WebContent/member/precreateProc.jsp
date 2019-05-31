<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi_member.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	String id = UploadSave.encode(upload.getParameter("id"));
	String email = UploadSave.encode(upload.getParameter("email"));

	String str = "";

	if (dao.duplicateId(id)) {
		str = "중복된 아이디 입니다. 아이디중복을 확인하세요.";
	} else if (dao.duplicateEmail(email)) {
		str = "중복된 이메일 입니다. 이메일중복을 확인하세요.";
	} else {
		//id와 email에 중복이 없으면 createProc.jsp로 이동해서 db에 회원정보를 저장한다.
		request.setAttribute("upload", upload);
%>
<jsp:forward page="/member/createProc.jsp" />
<%
	return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>아이디와 이메일 중복확인</title>
<meta charset="utf-8">
</head>
<body>
	<jsp:include page="/menu/top.jsp" />
	<div class="container">
		<div class="well well-lg">
			<br>
			<%=str%>


		</div>
		<button class="btn btn-default"type="button" onclick="history.back()">다시시도</button>
	</div>
</body>
</html>

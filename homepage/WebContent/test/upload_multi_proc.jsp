<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<% 
     String upDir = "/test/storage";
     String downDir = "/test/storage";
     
     //파일 저장용 절대 경로 추출
     upDir = application.getRealPath(upDir);
     //system.out.println("upDir: " + upDir);
     
    //ServletContext ctx = request.getServletContext(); 
		//ctx.getRealPath(upDir); 
		 
		//파일 업로드시 임시 저장 폴더 
		String tempDir = application.getRealPath("/test/temp"); 

%> 

 
<!DOCTYPE html> 
<html> 
<head>
  <title>파일 업로드 처리</title>
  <meta charset="utf-8">
  <style type="text/css">
  *{
    font-family: gulim;
    font-size: 24px;
  }
  </style>
  <link href='../css/style.css' rel='Stylesheet' type='text/css'>
  
</head>
<body> 
<h3>
<br><br>
전송된 파일 목록<br><br>
<%
//-------------------------------------------
// Fileupload 컴포넌트 관련 코드, 하나의 파일을 업로드 처리
//-------------------------------------------
String title= "";                 //일반폼 태그
FileItem fileItem = null;    //업로드 파일 객체
String filename = "";         //업로드 파일명
long filesize = 0;              //파이 사이즈

/*
 @param request HttpServletRequest 객체 
 @param threshold 메모리에 저장할 최대크기 
 @param max 업로드할 최대 파일크기 
 @param repositoryPath 업로드 경로 
*/
UploadSave upload = new UploadSave(request, -1, -1, tempDir);

title = UploadSave.encode(upload.getParameter("title"));

out.println("제목: " + title + "<br><br>");

fileItem = upload.getFileItem("file1"); //File 객체를 FileItem으로 재정의
filesize = fileItem.getSize();                //파일 사이즈

if(filesize > 0) { 
	  filename = UploadSave.saveFile(fileItem, upDir); // 저장된 파일명 리턴 
	  out.println("전송된 파일명: " + filename + "  / 전송된 파일 사이즈: " + filesize + "<br>"); 
	}

fileItem = upload.getFileItem("file2");
filesize = fileItem.getSize(); //파일 사이즈

if(filesize > 0) { 
	  filename = UploadSave.saveFile(fileItem, upDir); // 저장된 파일명 리턴 
	  out.println("전송된 파일명: " + filename + "  / 전송된 파일 사이즈: " + filesize + "<br>"); 
	}

fileItem = upload.getFileItem("file3");
filesize = fileItem.getSize(); //파일 사이즈

if(filesize > 0) { 
    filename = UploadSave.saveFile(fileItem, upDir); // 저장된 파일명 리턴 
    out.println("전송된 파일명: " + filename + "  / 전송된 파일 사이즈: " + filesize + "<br>"); 
  }

%>
</h3>
</body> 
</html> 
<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html> 
<html> 
<head>
  <title>파일 업로드 폼</title>
  <meta charset="utf-8">
  <style type="text/css">
  *{
  font-family: 굴림체;
  font-size: 24px;
  }
  </style>
  <link href='../css/style.css' rel='Stylesheet' type='text/css'>
</head>
<body> 
<div class="container">
<div class='title'>파일전송 테스트</div>

<div class='content'>
<form name="frm"
      action="./upload_multi_proc.jsp"
      method="post"
      enctype="multipart/form-data">
      ①파일: <input type="file" name="file1" size="50"><br>
      ②파일: <input type="file" name="file2" size="50"><br>
      ③파일: <input type="file" name="file3" size="50"><br>
      파일 설명: <input type="text" name="title" size="50" value="시원한 설악산 계곡"><br>
      <input type="submit" value="전송">
      </form>
</div>
</div>
</body> 
</html> 
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
 
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">글등록</h1>
<form class="form-horizontal" 
      action="createProc.jsp"
      method="post"
      enctype="multipart/form-data"
      >

 
  <div class="form-group">
    <label class="control-label col-sm-2" for="title">제목</label>
    <div class="col-sm-6">
      <input type="text" name="title" id="title" class="form-control">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="content">내용</label>
    <div class="col-sm-8">
    <textarea rows="4" cols="4" id="content" name="content" class="form-control"></textarea>
    </div>
  </div>

<div class="form-group">
    <label class="control-label col-sm-2" for="etc">참조</label>
    <div class="col-sm-6">
      <input type="text" name="etc" id="etc" class="form-control">
    </div>
  </div>  
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="filename">파일</label>
    <div class="col-sm-6">
      <input type="file" name="filename" id="filename" class="form-control">
    </div>
  </div>  
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn btn-default">등록</button>
    <button type="reset" class="btn btn-default">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 
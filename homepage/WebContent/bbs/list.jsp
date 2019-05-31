<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi_bbs.jsp" %>
<jsp:useBean id="dao" class="bbs.BbsDAO" />
<%
     //검색관련-----------------------
     String col = Utility.checkNull(request.getParameter("col"));
     String word = Utility.checkNull(request.getParameter("word"));
     if(col.equals("total")) word = "";
     
     //페이지관련-----------------------
     int nowPage = 1; //현재 보고있는 페이지
     if(request.getParameter("nowPage")!=null){
    	 nowPage = Integer.parseInt(request.getParameter("nowPage"));
     }
     int recordPerPage = 6; //한페이지당 보여줄 레코드 갯수
     
     //DB에서 가져올 순번-----------------
     int sno = ((nowPage-1)*recordPerPage) +1;
     int eno = nowPage * recordPerPage;
     
     
     Map map = new HashMap();
     map.put("col", col);
     map.put("word", word);
     map.put("sno", sno);
     map.put("eno", eno);
     
     int total = dao.total(col, word);
     
     List<BbsDTO> list = dao.list(map);
%> 

<!DOCTYPE html> 
<html> 
<head>
  <title>게시글 목록</title>
  <meta charset="utf-8">
  <script type="text/javascript">
      function read(bbsno){
        var url = "read.jsp";
        url += "?bbsno="+bbsno;      //javascript 변수
        
        url += "&col=<%=col%>";   //jsp 변수 (스크립틀릿)
        url += "&word=<%=word%>";
        url += "&nowPage=<%=nowPage%>";
        
        location.href=url;
      }
  </script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="container">
    <h2 style="color: white;">게시글 목록</h2>
    <br>
    <form class="form-inline" action="./list.jsp">
      <div class="form-group" >
        <select class="form-control" name="col">
          <option value="wname"
          <% if(col.equals("wname")) out.print("selected");%>>작성자</option>
          <option value="title"
          <% if(col.equals("title")) out.print("selected");%>>제목</option>
          <option value="content"
          <% if(col.equals("content")) out.print("selected");%>>내용</option>
          <option value="title_content"
          <% if(col.equals("title_content")) out.print("selected");%>>제목+내용</option>
          <option value="total"
          <% if(col.equals("total")) out.print("selected");%>>전체출력</option>
        </select>
      </div>
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Enter 검색어" 
        name="word" value="<%=word %>">
      </div>
      <button type="submit" class="btn btn-default">검색</button>
      <button type="button" class="btn btn-default" onclick="location.href='createForm.jsp'">등록</button>
    </form>
     <table class = "table table-striped" style='background-color:lightblue; filter: Alpha(Opacity=50);'>
        <thead>
          <tr>
          <th>번호</th>
          <th>제목</th>
          <th>작성자</th>
          <th>Grpno</th>
          <th>Indent</th>
          <th>Ansnum</th>
          </tr>
          </thead>
          <tbody>
<% if(list.size()==0){ %>
	 <tr><td colspan ="4">등록된 게시글이 없습니다.</td>

<% }else{
	for(int i=0; i<list.size(); i++){
		BbsDTO dto = list.get(i);
	%>
	<tr>
	   <td><%=dto.getBbsno() %></td>
	   <td>
	   <%
	       for(int r=0; r<dto.getIndent(); r++){
	    	   out.print("&nbsp&nbsp&nbsp&nbsp&nbsp;");
	       }
	    	 if(dto.getIndent()>0){
	    		 out.print("<img src='../images/re.jpg'>");
	    	 }
	   %>
	   <a href="javascript:read('<%=dto.getBbsno() %>')"><%=dto.getTitle() %></a>
	   <% if(Utility.compareDay(dto.getWdate())) {%>
	     <img src="../images/new.gif">
	   <%} %>
	   
	   
	   </td>
	   <td><%=dto.getWname() %></td>
	   <td><%=dto.getGrpno() %></td>
	   <td><%=dto.getIndent() %></td>
	   <td><%=dto.getAnsnum() %></td>
	   <tr>
<%
	} //for_end
}//if_end
%>	 
          </tbody>
     </table>
      <div>
         <%=Utility.paging(total, nowPage, recordPerPage, col, word) %>
      </div>
</div>
</body> 
</html> 
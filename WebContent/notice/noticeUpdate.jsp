<%@page import="com.jy.notice.NoticeDTO"%>
<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
    	
    	int num = Integer.parseInt(request.getParameter("num"));
    	
    	NoticeDAO noticeDAO = new NoticeDAO();
    	Connection con = DBConnetor.getConnection();
    	NoticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);
    	
    	con.close();	
    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<%@ include file="../layout/nav.jsp" %>

<% if(memberDTO ==null && memberDTO.getId() != noticeDTO.getWriter()){
	request.setAttribute("msg", "권한 없음");
	request.setAttribute("path", "../index.jsp");
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
} %>


	<div class="container">
  		
  		<form action="./NoticeUpdateResult.jsp" method="post">
  		<h1>Update Your List</h1>
  			<input type="hidden" name="num" value="<%=noticeDTO.getNum() %>">
  		
    		<div class="form-group">
      			<label for="title">title:</label>
      			<input type="text" class="form-control" id="title"  value ="<%=noticeDTO.getTitle() %>" placeholder="Enter title" name="title">
    		</div><br>
    		
    		<div class="contents">
      			<label for="contents">contents:</label>
      			<textarea class="form-control" id="contents"  placeholder="Enter contents" name="contents"><%=noticeDTO.getContents()%></textarea>
    		</div><br>
    		
    		
    			<button type="submit" class="btn btn-default">Submit</button>
  			</form>
				</div>

</body>
</html>
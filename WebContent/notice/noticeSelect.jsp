<%@page import="com.jy.notice.NoticeDTO"%>
<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
 
NoticeDTO noticeDTO =(NoticeDTO)request.getAttribute("dto");

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
<style>
body{
	background-color: GhostWhite;}

.t1{ 
	width: 100%;
	border: 1px black hidden;
	border-spacing: 0px;
	border-collapse: collapse;
	margin: 0 auto;
	margin-top: 100px;
	text-align: center;
	
	
	}
	td{
	height:40px;
	color: black;	
	border-bottom: 5px GhostWhite solid; 
	background-color: white;			
	}


.n1{
	text-align:center; 
	font-weight: bold;
	}
	
.t2{
	width: 10%;
	}
	
.t3{
	background-color: black;
	color: white;
	font-weight: bold;
}
.t4{
	text-align: left;
}

.a1{
	color: black;
	text-decoration: none;

}
.c1{
	border-style: none;
}
#noticeCon{
	height: 500px;
	color: black;	
	border-bottom: 5px GhostWhite solid; 
	background-color: white;
	font-weight: bold;
}




</style>

</head>
<body>
	
		<%-- <%@ include file="../layout/nav.jsp" %> --%>
		<div class="container">
  			<div>
    			<h1 class="n1">Notice Select Result Page</h1>  
    			
    			<table class="t1">
    				<tr>
						<td class="t2 t3">NUM</td>
						<td class="t2 t3">Title</td>
						<td class="t2 t3">Writer</td>
						<td class="t2 t3">Date</td>
						<td class="t2 t3">Hit</td>
						</tr>
    			<tr>
    				<td ><%=noticeDTO.getNum() %></td>
    				<td ><%=noticeDTO.getTitle() %></td>
    				<td ><%=noticeDTO.getWriter() %></td>
    				<td ><%=noticeDTO.getReg_date() %></td>
    				<td ><%=noticeDTO.getHit()%></td>
    				
    			</tr>
    			</table>  
    			<br> 
    			<div>
    				<div id ="noticeCon"> Contents : <%=noticeDTO.getContents() %></div>
    			</div>
    			 
  			</div>
  			<br>
  			<div>
  			
  			
  			</div>
 			  
		</div>
		
		
		
		
		
</body>
</html>
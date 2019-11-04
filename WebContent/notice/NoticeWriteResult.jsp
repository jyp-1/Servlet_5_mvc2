
<%@page import="com.jy.utill.DBConnetor"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.jy.notice.NoticeDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.jy.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDTO noticeDTO = new NoticeDTO();
	
	
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setWriter(request.getParameter("writer"));
	noticeDTO.setContents(request.getParameter("contents"));
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnetor.getConnection();
	int result = noticeDAO.noticeWrite(con, noticeDTO);
	
	con.close();
	
	String message="Write fail";
	if(result>0){
		message="Write Success";
	}
	
	if(result==0){
		request.setAttribute("msg", message);
		request.setAttribute("path", "./noticeList.jsp" );
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}else{
		response.sendRedirect("./noticeList.jsp");
	}
	
	

%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>
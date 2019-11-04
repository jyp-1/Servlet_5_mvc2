<%@page import="com.jy.notice.NoticeDTO"%>
<%@page import="com.jy.member.MemberDTO"%>
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
	int result = noticeDAO.noticeDelete(con, num);
	
	MemberDTO memberDTO = new MemberDTO();
	NoticeDTO noticeDTO = new NoticeDTO();
	con.close();
	
	
	 if(memberDTO !=null && memberDTO.getId() != noticeDTO.getWriter()){
		request.setAttribute("msg", "권한 없음");
		request.setAttribute("path", "../index.jsp");
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	} 
	
	
	
	String message="Delete Fail";
		if(num>0){
			message="Delete Success";
		}
	
	if(result==0){
		response.sendRedirect("./noticeList.jsp");
		}else{
			request.setAttribute("msg", message);
			request.setAttribute("path", "./noticeList.jsp");
			RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
			view.forward(request, response);
			
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
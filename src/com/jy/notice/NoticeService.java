package com.jy.notice;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jy.action.ActionFoward;
import com.jy.utill.DBConnetor;

public class NoticeService {
	
	private NoticeDAO noticeDAO;
	
	public NoticeService() {
		noticeDAO = new NoticeDAO();
	}
	
	public ActionFoward noticeinsert(HttpServletRequest request, HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		
		String method =  request.getMethod();
		
		if(method.equals("POST")) {
			
			try {
				Connection con = DBConnetor.getConnection();
				
				
				  int result = noticeDAO.noticeWrite(con, dto); con.close(); if(result>0) {
				  
				  }else {
				  
				  }
				 
				
			}catch (Exception e) {
				// TODO: handle exception
			}
			
		}else {
			actionFoward.setFlag(true);
			actionFoward.setPath("./noticeWrite.jsp");
		}
		
		
		
		
		return actionFoward;
	}
	
	
	public ActionFoward noticeList(HttpServletRequest request , HttpServletResponse response){
		//DAO 보내기전 전처리 작업 
		//DAO 호출 후 후처리 작업 
		ActionFoward actionFoward = new ActionFoward();
		try {
		Connection con = DBConnetor.getConnection();
		ArrayList<NoticeDTO> ar = noticeDAO.noticeList(con);	
		con.close();
		
		request.setAttribute("list", ar);
		actionFoward.setFlag(true);
		actionFoward.setPath("./noticeList.jsp");
			}catch (Exception e) {
				// TODO: handle exception
			}
			return actionFoward;
		}
	
	
	public ActionFoward noticeSelect(HttpServletRequest request , HttpServletResponse response) {
		ActionFoward actionFoward = new ActionFoward();
		try {
			Connection con = DBConnetor.getConnection();
			int num = Integer.parseInt(request.getParameter("num"));
			NoticeDTO noticeDTO = noticeDAO.noticeSelect(con, num);
			
			if(noticeDTO !=null) {
				request.setAttribute("dto", noticeDTO);
				actionFoward.setFlag(true);
				actionFoward.setPath("./noticeSelect.jsp");
			}else {
				actionFoward.setFlag(false);
				actionFoward.setPath("./noticeList.notice");
			}
			
			con.close();		
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return actionFoward;
	}
	
	
	public void NoticeWrite() {
		
	}
	
	

}

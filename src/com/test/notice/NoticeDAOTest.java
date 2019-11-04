package com.test.notice;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.jy.notice.NoticeDAO;
import com.jy.utill.DBConnetor;

public class NoticeDAOTest {
	private NoticeDAO noticeDAO;
	private Connection con;
	
	public NoticeDAOTest() {
	noticeDAO = new NoticeDAO();
	
	}
	
	
	//@BeforeClass
	public static void beforeClass() {
		System.out.println("before class");
	}
	
	//@AfterClass
	public static void afterClass() {
		System.out.println("after class");
	}
	
	
	@Before
	public void before() throws Exception{
		System.out.println("before");
		con = DBConnetor.getConnection();
		con.setAutoCommit(false);
	}
	
	@After
	public void after() throws Exception{
		System.out.println("after");
		//con.commit();
		con.rollback();
		con.setAutoCommit(true);
		con.close();
	}
	
	@Test
	public void listTest() throws Exception{
		Connection con = DBConnetor.getConnection();
		noticeDAO.noticeList(con);
		
	}
	
	@Test
	public void selectTest() throws Exception{
		Connection con = DBConnetor.getConnection();
		noticeDAO.noticeSelect(con, num);
	}
	
}
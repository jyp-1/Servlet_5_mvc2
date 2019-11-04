package com.test.utill;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.jy.utill.DBConnetor;

public class DBConnectorTest {

	@Test
	public void test() throws Exception{
		Connection con =DBConnetor.getConnection();
		assertNotNull(con);
	}

}

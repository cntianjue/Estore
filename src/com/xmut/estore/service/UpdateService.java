package com.xmut.estore.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.xmut.estore.dao.LoginDAO;
import com.xmut.estore.dao.updateDAO;
import com.xmut.estore.db.JDBCUtils;

public class UpdateService {

	public String update(String account, String pass) {
      String   result="";
		Connection con=JDBCUtils.getConnection();

	
		try {
			result= new updateDAO().updateMBC(con,account,pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JDBCUtils.release(con);
		return result;
	
	}

}

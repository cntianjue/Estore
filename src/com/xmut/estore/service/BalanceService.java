package com.xmut.estore.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.xmut.estore.dao.BalanceDAO;
import com.xmut.estore.dao.LoginDAO;
import com.xmut.estore.db.JDBCUtils;

public class BalanceService {

	public String balance(String account) throws SQLException {
		String result="";
		Connection con = JDBCUtils.getConnection();

		 result= new BalanceDAO().balance(con, account);

		JDBCUtils.release(con);
		return result;
	}

}

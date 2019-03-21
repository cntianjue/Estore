package com.xmut.estore.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.spi.DirStateFactory.Result;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.xmut.estore.dao.LoginDAO;
import com.xmut.estore.db.JDBCUtils;

public class LoginService {

	public String login(String account, String pass, String pic, Object rpic) throws SQLException {
		String result = "登录失败";
		if (account == null || pass == null || pic == null) {
			return result;
		}
		String picture = (String) rpic;

		if (!picture.equals(pic)) {
			result = "验证码有误";
			return result;
		}
		Connection con = JDBCUtils.getConnection();

		String rpass = new LoginDAO().findPBA(con, account);

		if (rpass.equals(pass)) {
			result = "登录成功";
			return result;
		}
		JDBCUtils.release(con);
		return result;
	}

}

package com.xmut.estore.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.xmut.estore.dao.LoginDAO;
import com.xmut.estore.dao.RegisterDAO;
import com.xmut.estore.db.JDBCUtils;

public class RegisterService {

	public String register(String account, String pass, Object rpic, String pic,String rpass) throws SQLException {
		String result = "注册失败";
		if (account == null || pass == null || pic == null) {
			return result;
		}
		String picture = (String) rpic;

		if (!picture.equals(pic)) {
			result = "验证码有误";
			return result;
		}
		if (!pass.equals(rpass)) {
			result = "两次密码不一致";
			return result;
		}
		Connection con = JDBCUtils.getConnection();

		result = new RegisterDAO().register(con, account, pass);

		JDBCUtils.release(con);
		return result;

	}

}

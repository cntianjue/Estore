package com.xmut.estore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDAO {

	public String register(Connection con, String account, String pass) throws SQLException {

		PreparedStatement state = null;

		String sql = "insert into login(user,pass) values(?,?)";

		try {
			state = con.prepareStatement(sql);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		state.setString(1, account);
		state.setString(2, pass);
		int set = state.executeUpdate();
		if (set > 0) {
			return "注册成功";
		}

		if (state != null) {
			state.close();
		}

		return "注册失败";

	}
}

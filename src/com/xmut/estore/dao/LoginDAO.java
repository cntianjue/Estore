package com.xmut.estore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

	public String findPBA(Connection con, String account) throws SQLException {
		String realPass = "";
		PreparedStatement state = null;
		ResultSet set = null;
		String sql = "select pass from login where user=?";

		state = con.prepareStatement(sql);
		state.setString(1, account);
		set = state.executeQuery();
		while (set.next()) {
			realPass = set.getString("pass");
		}

		if (set != null) {
			set.close();
		}
		if (state != null) {
			state.close();
		}

		return realPass;

	}
}

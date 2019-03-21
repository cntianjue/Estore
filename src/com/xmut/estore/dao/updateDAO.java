package com.xmut.estore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class updateDAO {

	public String updateMBC(Connection con, String account, String pass) throws SQLException {

		PreparedStatement state = null;

		String sql = "update login set pass=? where user=?";

		try {
			state = con.prepareStatement(sql);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		state.setString(1, pass);
		state.setString(2, account);
		int set = state.executeUpdate();
		if (set > 0) {
			return "修改成功";
		}

		if (state != null) {
			state.close();
		}

		return "修改失败";

	}

}

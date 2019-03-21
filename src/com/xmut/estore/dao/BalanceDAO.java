package com.xmut.estore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BalanceDAO {

	public String balance(Connection con, String account) throws SQLException {
		int accountid = 0;
		long balance = 0;
		PreparedStatement state = null;
		ResultSet set = null;
		String sql = "select accountid from userinfo where username=?";

		state = con.prepareStatement(sql);
		state.setString(1, account);
		set = state.executeQuery();
		while (set.next()) {
			accountid = set.getInt("accountid");
		}
		String sql1 = "select balance from account where accountid=?";

		state = con.prepareStatement(sql1);
		state.setLong(1, accountid);
		set = state.executeQuery();
		while (set.next()) {
			balance = set.getLong("balance");
		}

		String balancee = String.valueOf(balance);

		if (set != null) {
			set.close();
		}
		if (state != null) {
			state.close();
		}

		return balancee;

	}

}

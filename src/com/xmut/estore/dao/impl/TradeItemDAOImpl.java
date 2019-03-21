package com.xmut.estore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.xmut.estore.dao.TradeItemDAO;
import com.xmut.estore.db.JDBCUtils;
import com.xmut.estore.domain.TradeItem;

public class TradeItemDAOImpl extends BaseDAO<TradeItem> implements TradeItemDAO {

	@Override
	public void batchSave(Collection<TradeItem> items) {
		String sql = "INSERT INTO `tradeitema`(`computerid`, `quantity`, `tradeid`) " +
				"VALUES(?,?,?)";
		Object [] params = new Object[3];

		
		List<TradeItem> tradeItems = new ArrayList<>(items);
		for(int i = 0; i < tradeItems.size(); i++){
		params[0]=tradeItems.get(i).getComputerId();
		params[1]=tradeItems.get(i).getQuantity();
		params[2]=tradeItems.get(i).getTradeId();
		 insert(sql, params);
		}
/*		for(int i = 0; i < tradeItems.size(); i++){
			params[i][0] = tradeItems.get(i).getComputerId();
			params[i][1] = tradeItems.get(i).getQuantity();
			params[i][2] = tradeItems.get(i).getTradeId(); 
	}*/
		/*batch(sql, params);*/
		/*for(int i = 0; i < tradeItems.size(); i++){
			params[0] = tradeItems.get(i).getComputerId();
			params[1] = tradeItems.get(i).getQuantity();
			params[2] = tradeItems.get(i).getTradeId(); 
		    insert(sql, params);
		
		}*/
	}

	@Override
	public Set<TradeItem> getTradeItemsWithTradeId(Integer tradeId) {
		String sql = "SELECT itemId tradeItemId, computerId, " +
				"quantity, tradeId FROM tradeitem WHERE tradeid = ?";
		return new HashSet<>(queryForList(sql, tradeId));
	}

}

package com.bx.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bx.bean.BxFeedback;
import com.bx.bean.BxRoom;
import com.bx.bean.BxSpecificItem;
import com.bx.constants.BxOpsConstants;
import com.bx.db.ConnToBxDB;
import com.mysql.jdbc.Connection;

public class BxGeneralOpDAOImpl {
	ArrayList allRoomList = null;
	ArrayList allItemDetailList = null;
	BxRoom bxRoom = null;
	BxSpecificItem bxSpecificItem = null;
	
	public ArrayList fetchAllRoomList(String Building_Num) throws ClassNotFoundException, SQLException
	{
		ArrayList allRoomList = new ArrayList();
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_ALL_ROOM_LIST);
		ps.setString(1, Building_Num);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			BxRoom bxRoom = new BxRoom();
			bxRoom.setRoomNum(rs.getString("Room_Num"));
			
			allRoomList.add(bxRoom);
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return allRoomList;
	}
	
	public  ArrayList fetchAllItemDetailList(String Item_Cate) throws ClassNotFoundException, SQLException
	{
		ArrayList allItemDetailList = new ArrayList();
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_ALL_ITEM_DETAIL_LIST);
		
		ps.setString(1, Item_Cate);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			BxSpecificItem bxSpecificItem = new BxSpecificItem();
			bxSpecificItem.setItemDetail(rs.getString("Item_Detail"));
			allItemDetailList.add(bxSpecificItem);
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return allItemDetailList;
	}
	
	public String fetchBxListStatusPerId (String fixid) throws SQLException, ClassNotFoundException
	{
		String status = "";
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_STATUS_PER_ID);
		ps.setString(1, fixid);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			status = rs.getString("Fix_Status");
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return status;
	}
	
	public void updateFeedback (BxFeedback bxFeedbackBean) throws SQLException, ClassNotFoundException
	{
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.UPDATE_FEEDBACK);
		ps.setString(1, bxFeedbackBean.getFeedId());
		ps.setString(2, bxFeedbackBean.getFixId());
		ps.setString(3, bxFeedbackBean.getFixEval());
		ps.setDate(4, (Date) bxFeedbackBean.getEvalDate());
		
		ps.executeUpdate();
		
		ps.close();
		conn.close();
	}
	
	public ArrayList<String> fetchProcessedList (String Username) throws SQLException, ClassNotFoundException
	{
		ArrayList<String> processedList = new ArrayList<String>();
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_PROCESSED_LIST);
		ps.setString(1, Username);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			processedList.add(rs.getString("Fix_Id"));
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return processedList;
	}
	
	public void updateLocation (String locationid) throws ClassNotFoundException, SQLException
	{
		Connection conn = ConnToBxDB.getBxConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(BxOpsConstants.UPDATE_LOCATION);
			ps.setString(1, locationid);
			ps.executeUpdate();						//Ö÷¼üÔ¼Êø
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

package com.bx.dao;

import java.sql.Date;
import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.bx.bean.BxAdmin;
import com.bx.bean.BxAffiche;
import com.bx.bean.BxBuilding;
import com.bx.bean.BxFeedback;
import com.bx.bean.BxGeneralItem;
import com.bx.bean.BxItem;
import com.bx.bean.BxList;
import com.bx.bean.BxListItem;
import com.bx.bean.BxRoom;
import com.bx.bean.BxUser;
import com.bx.bean.BxWorker;
import com.bx.constants.BxOpsConstants;
import com.bx.db.ConnToBxDB;
import com.mysql.jdbc.Connection;

public class BxDAOImpl {

	BxAffiche ba = null;
	BxAdmin bxAdminInfo = null;
	ArrayList allAffiche = null;
	ArrayList bxAdminInfoList = null;
	ArrayList allBxListInFix = null;
	ArrayList allFeedbackList = null;
	ArrayList allUserList = null;
	ArrayList allUserCrenList = null;
	ArrayList allBuildingList = null;
	ArrayList allCateList = null;
	ArrayList allBxListItemAfterFill = null;
	
	BxBuilding bxBuilding = null;
	BxItem bxItem = null;
	BxList bxList = null;
	BxListItem bxListItem = null;
	BxRoom bxRoom = null;
	BxUser bxUser = null;
	BxUser bxUserCrendentials = null;
	BxFeedback bxFeedback = null;
	BxWorker bxWorker = null;
	BxGeneralItem bxGeneralItem = null;

	public ArrayList getPublishedContent()
			throws ClassNotFoundException, SQLException {
		/* 获取数据库连接 */

		ArrayList allAffiche = new ArrayList();

		Connection conn = ConnToBxDB.getBxConnection();
		Statement stmt = (Statement) conn.createStatement();
		// String sql = "select * from bx_affiche";

		ResultSet rs = stmt
				.executeQuery(BxOpsConstants.GET_ALL_PUBLISHED_CONTENT);

		while (rs.next()) {
			BxAffiche ba = new BxAffiche();
			//BxAdmin bxAdminName = new BxAdmin();

			ba.setAfficheId(rs.getString("Id"));
			ba.setAdminId(rs.getString("Admin_Id"));
			
			//bxAdminName.setAdminName(fetchAdminNamePerId(ba.getAdminId()));
			
			//System.out.println(bxAdminName.getAdminName());
			
			ba.setAfficheTitle(rs.getString("Affiche_Title"));
			ba.setAfficheCont(rs.getString("Affiche_Cont"));
			ba.setAfficheDate(rs.getDate("Affiche_Pub_Date"));

			allAffiche.add(ba);
			//allAffiche.add(bxAdminName);
		}

		rs.close();
		stmt.close();
		conn.close();

		return allAffiche;
	}

	public void insertAffiche(BxAffiche ba) throws ClassNotFoundException,
			SQLException {
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.INSERT_AFFICHE);
		
		java.util.Date afficheUtilDate = ba.getAfficheDate();
		java.sql.Date afficheSqlDate = new java.sql.Date(afficheUtilDate.getTime());
		
		ps.setString(1, ba.getAfficheId());
		ps.setString(2, ba.getAfficheTitle());
		ps.setString(3, ba.getAfficheCont());
		ps.setDate(4,  afficheSqlDate);
		ps.setString(5, ba.getAdminId());

		ps.executeUpdate();
		
		ps.close();
		conn.close();
	}

	public ArrayList<BxAdmin> fetchAdminInfo() throws ClassNotFoundException,
			SQLException {
		ArrayList bxAdminInfoList = new ArrayList<BxAdmin>();

		Connection conn = ConnToBxDB.getBxConnection();
		Statement stmt = (Statement) conn.createStatement();

		ResultSet rs = stmt
				.executeQuery(BxOpsConstants.FETCH_ADMIN_CREDENTIALS);

		while (rs.next()) {
			BxAdmin bxAdminInfo = new BxAdmin();

			bxAdminInfo.setAdminId(rs.getString("Admin_Id"));
			bxAdminInfo.setAdminName(rs.getString("Admin_Name"));
			bxAdminInfo.setAdminPwd(rs.getString("Admin_Pwd"));

			bxAdminInfoList.add(bxAdminInfo);
		}

		rs.close();
		stmt.close();
		conn.close();

		return bxAdminInfoList;
	}

	public ArrayList fetchAllBxListInFix(String bxmanagetype) throws ClassNotFoundException,
			SQLException {
		ArrayList allBxListInFix = new ArrayList();

		Connection conn = ConnToBxDB.getBxConnection();
		Statement stmt = (Statement) conn.createStatement();

		ResultSet rs = stmt.executeQuery(BxOpsConstants.FETCH_ALL_BX_LIST);

		while (rs.next()) {
			BxBuilding bxBuilding = new BxBuilding();
			BxList bxList = new BxList();

			bxList.setListId(rs.getString("Fix_Id"));
			bxList.setFixStartDate(rs.getDate("Fix_Start_Date")); // 這裡可能出現異常Date
			bxList.setFixStatus(rs.getString("Fix_Status"));
			bxList.setStdName(rs.getString("Username"));
			bxList.setFixWorkerId(rs.getString("Fix_Worker_Id"));
			bxList.setFixItem(rs.getString("Fix_Item"));
			
			allBxListInFix.add(bxList);
		}

		rs.close();
		stmt.close();
		conn.close();

		return allBxListInFix;

	}

	public ArrayList fetchAllFeedbackList() throws ClassNotFoundException,
			SQLException {
		ArrayList allFeedbackList = new ArrayList();
		Connection conn = ConnToBxDB.getBxConnection();
		Statement stmt = (Statement) conn.createStatement();

		ResultSet rs = stmt
				.executeQuery(BxOpsConstants.FETCH_ALL_BX_FEEDBACK_LIST);

		while (rs.next()) {
			BxFeedback bxFeedback = new BxFeedback();
			
			bxFeedback.setFixId(rs.getString("Fix_Id"));
			bxFeedback.setFix_Start_Date(rs.getDate("Fix_Start_Date"));
			bxFeedback.setFixEval(rs.getString("Fix_Eval"));
			bxFeedback.setWorker_Name(rs.getString("Worker_Name"));

			allFeedbackList.add(bxFeedback);
		}

		rs.close();
		stmt.close();
		conn.close();

		return allFeedbackList;
	}

	public ArrayList<BxUser> fetchAllUserList() throws ClassNotFoundException,
			SQLException {
		ArrayList<BxUser> allUserList = new ArrayList<BxUser>();
		Connection conn = ConnToBxDB.getBxConnection();
		Statement stmt = (Statement) conn.createStatement();

		ResultSet rs = stmt.executeQuery(BxOpsConstants.FETCH_ALL_USER_LIST);

		while (rs.next()) {
			BxUser bxUser = new BxUser();

			bxUser.setUname(rs.getString("uname"));
			bxUser.setUsername(rs.getString("Username"));
			bxUser.setRegTime(rs.getDate("RegTime"));
			bxUser.setLoginCount(rs.getInt("LoginCount"));

			allUserList.add(bxUser);
		}

		rs.close();
		stmt.close();
		conn.close();

		return allUserList;
	}

	public void addNewUser(BxUser newUserInfo) throws ClassNotFoundException,
			SQLException {
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn
				.prepareStatement(BxOpsConstants.ADD_NEW_USER);
		ps.setString(1, newUserInfo.getUsername());
		ps.setString(2, newUserInfo.getUname());
		ps.setString(3, newUserInfo.getPassword());
		ps.setDate(4, (Date) newUserInfo.getRegTime());
		ps.setInt(5, newUserInfo.getLoginCount());

		ps.executeUpdate();

		ps.close();
		conn.close();
	}

	public String getAdminId(String adminName) throws SQLException,
			ClassNotFoundException {
		String adminId = null;

		System.out.println("DAO adminName:"+adminName);
		
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn
				.prepareStatement(BxOpsConstants.GET_ADMIN_ID);
		ps.setString(1, adminName);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			adminId = (String) rs.getString("Admin_Id");
		}
		rs.close();
		ps.close();
		conn.close();

		return adminId;
	}

	public void addNewRegUser(BxUser newRegUser) throws ClassNotFoundException,
			SQLException {
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn
				.prepareStatement(BxOpsConstants.ADD_NEW_REG_USER);
		java.util.Date regtime = new java.util.Date();
		long t = regtime.getTime();
		java.sql.Date regSqlTime = new java.sql.Date(t);

		ps.setString(1, newRegUser.getUsername());
		ps.setString(2, newRegUser.getUname());
		ps.setString(3, newRegUser.getPassword());
		ps.setDate(4, regSqlTime);
		ps.setInt(5, newRegUser.getLoginCount());

		ps.executeUpdate();

		ps.close();
		conn.close();
	}

	public ArrayList<BxUser> fetchCrendentials() throws SQLException,
			ClassNotFoundException {
		Connection conn = ConnToBxDB.getBxConnection();
		Statement stmt = conn.createStatement();
		ArrayList<BxUser> allUserCrenList = new ArrayList<BxUser>();

		ResultSet rs = stmt
				.executeQuery(BxOpsConstants.FETCH_ALL_UER_CREDENTIALS);

		while (rs.next()) {
			BxUser bxUserCrendentials = new BxUser();
			bxUserCrendentials.setUname(rs.getString("uname"));
			bxUserCrendentials.setUsername(rs.getString("Username"));
			bxUserCrendentials.setPassword(rs.getString("Password"));
			allUserCrenList.add(bxUserCrendentials);
		}

		rs.close();
		stmt.close();
		conn.close();

		return allUserCrenList;
	}

	public ArrayList fetchAllBuildingList() throws SQLException,
			ClassNotFoundException {
		Connection conn = ConnToBxDB.getBxConnection();
		Statement stmt = conn.createStatement();
		ArrayList allBuildingList = new ArrayList();

		ResultSet rs = stmt
				.executeQuery(BxOpsConstants.FETCH_ALL_BUILDING_LIST);

		while (rs.next()) {
			BxBuilding bxBuilding = new BxBuilding();
			bxBuilding.setBuildingNum(rs.getString("Building_Num"));
			allBuildingList.add(bxBuilding);
		}

		rs.close();
		stmt.close();
		conn.close();

		return allBuildingList;
	}

	public ArrayList fetchAllCateList() throws SQLException,
			ClassNotFoundException {
		Connection conn = ConnToBxDB.getBxConnection();
		Statement stmt = conn.createStatement();
		ArrayList allCateList = new ArrayList();

		ResultSet rs = stmt.executeQuery(BxOpsConstants.FETCH_ALL_CATE_LIST);

		while (rs.next()) {
			BxGeneralItem bxGeneralItem = new BxGeneralItem();
			bxGeneralItem.setItemCate(rs.getString("Item_Cate"));

			allCateList.add(bxGeneralItem);
		}

		rs.close();
		stmt.close();
		conn.close();

		return allCateList;
	}

	public void addBxList(HashMap addBxListMap) throws SQLException,
			ClassNotFoundException {
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn
				.prepareStatement(BxOpsConstants.ADD_NEW_BX_ITEM);

		ps.setString(1, (String) addBxListMap.get("Fix_Item"));
		ps.setString(2, (String) addBxListMap.get("Item_Desc"));
		ps.setString(3, (String) addBxListMap.get("Building_Num"));
		ps.setString(4, (String) addBxListMap.get("Room_Num"));
		ps.setString(5, (String) addBxListMap.get("Item_Cate"));
		ps.setString(6, (String) addBxListMap.get("Item_Detail"));
		ps.setDate(7, (java.sql.Date) addBxListMap.get("Epec_Fix_Date"));

		ps.executeUpdate();

		// 插入到bx_fix里
		PreparedStatement ps2 = conn
				.prepareStatement(BxOpsConstants.ADD_NEW_BX_LIST_TEMP);

		ps2.setString(1, (String) addBxListMap.get("Fix_Id"));
		ps2.setString(2, (String) addBxListMap.get("Username"));
		ps2.setNull(3, java.sql.Types.DATE);
		ps2.setNull(4, java.sql.Types.CHAR);
		ps2.setNull(5, java.sql.Types.CHAR);
		ps2.setString(6, (String) addBxListMap.get("Fix_Item"));

		String Fix_Status = ((String) addBxListMap.get("Fix_Status"));

		ps2.setString(7, Fix_Status);

		ps2.executeUpdate();

		ps.close();
		ps2.close();
		conn.close();
	}

	public ArrayList<BxListItem> fetchAllUserBxListAfterFill() throws SQLException,
			ClassNotFoundException {
		Connection conn = ConnToBxDB.getBxConnection();
		Statement stmt = conn.createStatement();
		ArrayList<BxListItem> allBxListItemAfterFill = new ArrayList<BxListItem>();
		

		ResultSet rs = stmt
				.executeQuery(BxOpsConstants.FETCH_ALL_USER_BX_LIST_AFTER_FILL);

		while (rs.next()) {

			BxListItem bxListItem = new BxListItem();
			
			bxListItem.setFix_Id(rs.getString("Fix_Id"));
			bxListItem.setUsername(rs.getString("Username"));
			System.out.println("Username:::::::::::"+bxListItem.getUsername());
			bxListItem.setFix_Status(rs.getString("Fix_Status"));
			bxListItem.setFix_Start_Date(rs.getDate("Fix_Start_Date"));
			bxListItem.setBuilding_Num(rs.getString("Building_Num"));
			bxListItem.setRoom_Num(rs.getString("Room_Num"));
			bxListItem.setItem_Cate(rs.getString("Item_Cate"));
			bxListItem.setItem_Detail(rs.getString("Item_Detail"));
			bxListItem.setItem_Desc(rs.getString("Item_Desc"));
			bxListItem.setEpec_Fix_Date(rs.getDate("Expec_Fix_Date"));// 这里可能出现异常Date
			
			allBxListItemAfterFill.add(bxListItem);
		}
		
		
		rs.close();
		stmt.close();
		conn.close();

		return allBxListItemAfterFill;
	}
	
	public BxAdmin fetchAdminNamePerId (String adminId) throws SQLException, ClassNotFoundException
	{
		BxAdmin bxAdminName = new BxAdmin();
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_ADMIN_NAME_PER_ID);
		ps.setString(1, adminId);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			bxAdminName.setAdminName(rs.getString("Admin_Name"));
		}
		
		return bxAdminName;
	}
	
	public BxItem fetchAllBxItemPerFixItem (String Fix_Item) throws SQLException, ClassNotFoundException
	{
		BxItem bxItem = new BxItem();
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_ALL_BX_ITEM_PER_FIX_ITEM);
		ps.setString(1, Fix_Item);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			bxItem.setItemDesc(rs.getString("Item_Desc"));
			System.out.println("Item_Desc "+bxItem.getItemDesc());
			bxItem.setBuildingNum(rs.getString("Building_Num"));
			bxItem.setRoomNum(rs.getString("Room_Num"));
			bxItem.setItemCate(rs.getString("Item_Cate"));
			bxItem.setItemDetail(rs.getString("Item_Detail"));
			bxItem.setEpecFixDate(rs.getDate("Expec_Fix_Date"));
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return bxItem;
	}
	
	public BxList fetchBxFixInfoForUpdateOp(String Fix_Id) throws SQLException, ClassNotFoundException
	{
		BxList bxInfoListForUpdate = new BxList();
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_BX_INFO_LIST_FOR_UPDATE);
		ps.setString(1, Fix_Id);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			bxInfoListForUpdate.setListId(rs.getString("Fix_Id"));
			bxInfoListForUpdate.setStdName(rs.getString("Username"));
			bxInfoListForUpdate.setFixStartDate(rs.getDate("Fix_Start_Date"));
			bxInfoListForUpdate.setFixWorkerId(rs.getString("Fix_Worker_Id"));
			bxInfoListForUpdate.setAdminId(rs.getString("Admin_Id"));
			bxInfoListForUpdate.setFixItem(rs.getString("Fix_Item"));
			bxInfoListForUpdate.setFixStatus(rs.getString("Fix_Status"));
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return bxInfoListForUpdate;
	}
	
	public BxItem fetchBxItemInfoForUpdateOp(String Fix_Item) throws SQLException, ClassNotFoundException
	{
		BxItem bxItemInfoForUpdate = new BxItem();
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_BX_INFO_ITEM_FOR_UPDATE);
		ps.setString(1, Fix_Item);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			bxItemInfoForUpdate.setItemDesc(rs.getString("Item_Desc"));
			bxItemInfoForUpdate.setBuildingNum(rs.getString("Building_Num"));
			bxItemInfoForUpdate.setRoomNum(rs.getString("Room_Num"));
			bxItemInfoForUpdate.setItemCate(rs.getString("Item_Cate"));
			bxItemInfoForUpdate.setItemDetail(rs.getString("Item_Detail"));
			bxItemInfoForUpdate.setEpecFixDate(rs.getDate("Expec_Fix_Date"));
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return bxItemInfoForUpdate;
	}
	
	public BxUser fetchBxUserInfoForUpdate(String Username) throws SQLException, ClassNotFoundException
	{
		BxUser bxUserInfoForUpdate = new BxUser();
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_BX_USER_INFO_FOR_UPDATE);
		ps.setString(1, Username);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			bxUserInfoForUpdate.setUname(rs.getString("uname"));
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return bxUserInfoForUpdate;
	}
	
	public ArrayList fetchAllBxWorkerNameList() throws SQLException, ClassNotFoundException
	{
		ArrayList allBxWorkerList = new ArrayList();
		BxWorker bxWorkerInfoForUpdate = new BxWorker();
		Connection conn = ConnToBxDB.getBxConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(BxOpsConstants.FETCH_ALL_BX_WORKER_LIST);
		
		while (rs.next())
		{
			bxWorkerInfoForUpdate.setWorkerName(rs.getString("Worker_Name"));
			allBxWorkerList.add(bxWorkerInfoForUpdate);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
		return allBxWorkerList;
	}
	
	public String fetchFixWorkerIdPerName(String fixworker) throws SQLException, ClassNotFoundException
	{
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_FIX_WORKER_ID_PER_NAME);
		ps.setString(1, fixworker);
		String fixWorkerId = "";
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			fixWorkerId = rs.getString("Fix_Worker_Id");
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return fixWorkerId;
	}
	
	public void updateBxList(BxList bxListUpdateInfo) throws ClassNotFoundException, SQLException
	{
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.UPDATE_BX_LIST);
		ps.setDate(1, (Date) bxListUpdateInfo.getFixStartDate());
		ps.setString(2, bxListUpdateInfo.getFixWorkerId());
		ps.setString(3, bxListUpdateInfo.getAdminId());
		ps.setString(4, bxListUpdateInfo.getFixStatus());
		ps.setString(5, bxListUpdateInfo.getListId());
		
		ps.executeUpdate();
		
		ps.close();
		conn.close();
	}
	
	public ArrayList fetchConditionalBxList(String Username, String status) throws SQLException, ClassNotFoundException
	{
		ArrayList<String> conditionalList = new ArrayList<String>();
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_CONDITIONAL_FIXED_LIST_ID);
		ps.setString(1, Username);
		ps.setString(2, status);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			conditionalList.add(rs.getString("Fix_Id"));
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return conditionalList;
	}
	
	public ArrayList fetchBxInfoForCheck(String fixid) throws SQLException, ClassNotFoundException
	{
		ArrayList checkList = new ArrayList();
		BxItem itemCheckBean = new BxItem();
		BxList listCheckBean = new BxList();
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_BX_INFO_FOR_CHECK);
		ps.setString(1, fixid);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			itemCheckBean.setItemDesc(rs.getString("Item_Desc"));
			itemCheckBean.setBuildingNum(rs.getString("Building_Num"));
			itemCheckBean.setRoomNum(rs.getString("Room_Num"));
			itemCheckBean.setItemCate(rs.getString("Item_Cate"));
			itemCheckBean.setItemDetail(rs.getString("Item_Detail"));
			itemCheckBean.setEpecFixDate(rs.getDate("Expec_Fix_Date"));
			listCheckBean.setListId(rs.getString("Fix_Id"));
			listCheckBean.setFixStartDate(rs.getDate("Fix_Start_Date"));
			listCheckBean.setFixWorkerId(rs.getString("Fix_Worker_Id"));
			listCheckBean.setFixStatus(rs.getString("Fix_Status"));
		}
		
		rs.close();
		ps.close();
		conn.close();
		checkList.add(itemCheckBean);
		checkList.add(listCheckBean);
		
		return checkList;
	}
	
	public String fetchWorkerNamePerId(String Fix_Worker_Id) throws SQLException, ClassNotFoundException
	{
		String Worker_Name = "";
		Connection conn = ConnToBxDB.getBxConnection();
		PreparedStatement ps = conn.prepareStatement(BxOpsConstants.FETCH_WORKER_NAME_PER_ID);
		ps.setString(1, Fix_Worker_Id);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next())
		{
			Worker_Name = rs.getString("Worker_Name");
		}
		
		rs.close();
		ps.close();
		conn.close();
		
		return Worker_Name;
	}
}

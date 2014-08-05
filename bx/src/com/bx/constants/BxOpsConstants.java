package com.bx.constants;

public interface BxOpsConstants {
	public static final String GET_ALL_PUBLISHED_CONTENT = "select * from bx_affiche";
	public static final String INSERT_AFFICHE = "insert into bx_affiche values (?,?,?,?,?)";
	public static final String FETCH_ADMIN_CREDENTIALS = "select Admin_Name,Admin_Pwd,Admin_Id from bx_admin";
	public static final String FETCH_ALL_BX_LIST = "select Fix_Id, Fix_Start_Date, Fix_Status, Username, Fix_Worker_Id, Fix_Item from bx_fix ";
	public static final String FETCH_ALL_BX_FEEDBACK_LIST = "select bx_fix.Fix_Id,Fix_Eval,Worker_Name,Fix_Start_Date "
			+ "from bx_fix,bx_feedback,bx_worker "
			+ "where bx_fix.Fix_Id = bx_feedback.Fix_Id "
			+ "and bx_fix.Fix_Worker_Id = bx_worker.Fix_Worker_Id";
	public static final String FETCH_ALL_USER_LIST = "select uname,Username,RegTime,LoginCount"
			+ " from bx_user";
	public static final String ADD_NEW_USER = "insert into bx_user values (?,?,?,?,?)";
	public static final String GET_ADMIN_ID = "select Admin_Id from bx_admin where Admin_Name=?";
	public static final String ADD_NEW_REG_USER = "insert into bx_user values (?,?,?,?,?)";
	public static final String FETCH_ALL_UER_CREDENTIALS = "select uname, Username, Password from bx_user";
	public static final String FETCH_ALL_BUILDING_LIST = "select Building_Num from bx_building";
	public static final String FETCH_ALL_ROOM_LIST = "select Room_Num from bx_room where Building_Num=?";
	public static final String FETCH_ALL_CATE_LIST = "select Item_Cate from bx_item_map";
	public static final String FETCH_ALL_ITEM_DETAIL_LIST = "select Item_Detail from bx_item_detail where Item_Cate=?";
	public static final String ADD_NEW_BX_ITEM = "insert into bx_item values (?,?,?,?,?,?,?)";
	public static final String ADD_NEW_BX_LIST_TEMP = "insert into bx_fix values (?,?,?,?,?,?,?)";
	public static final String FETCH_ALL_USER_BX_LIST_AFTER_FILL = "select Fix_Id, Username, Fix_Status, Fix_Start_Date, Building_Num, Room_Num, Item_Cate, Item_Detail, Item_Desc, Expec_Fix_Date "
			+ "from bx_fix, bx_item "
			+ "where bx_item.Fix_Item = bx_fix.Fix_Item";
	public static final String FETCH_ADMIN_NAME_PER_ID = "select Admin_Name from bx_admin where Admin_Id = ?";
	public static final String FETCH_ALL_BX_ITEM_PER_FIX_ITEM = "select Item_Desc, Building_Num, Room_Num, Item_Cate, Item_Detail, Expec_Fix_Date from bx_item where Fix_Item = ? ";
	public static final String FETCH_BX_INFO_LIST_FOR_UPDATE = "select * from bx_fix where Fix_Id = ? ";
	public static final String FETCH_BX_INFO_ITEM_FOR_UPDATE = "select * from bx_item where Fix_Item =? ";
	public static final String FETCH_BX_USER_INFO_FOR_UPDATE = "select uname from bx_user where Username = ?";
	public static final String FETCH_ALL_BX_WORKER_LIST = "select Worker_Name from bx_worker";
	public static final String FETCH_FIX_WORKER_ID_PER_NAME = "select Fix_Worker_Id from bx_worker where Worker_Name=? ";
	public static final String UPDATE_BX_LIST = "update bx_fix set Fix_Start_Date=?, Fix_Worker_Id=?, Admin_Id=?, Fix_Status=?  where Fix_Id =?";
	public static final String FETCH_CONDITIONAL_FIXED_LIST_ID = "select Fix_Id from bx_fix where Username=? and Fix_Status=?";
	public static final String FETCH_BX_INFO_FOR_CHECK = "select Item_Desc,Building_Num, Room_Num, Item_Cate, Item_Detail, "+
														 "Expec_Fix_Date, Fix_Id, Fix_Start_Date, Fix_Worker_Id, Fix_Status "+
														 "from bx_item, bx_fix "+
														 "where bx_item.Fix_Item = bx_fix.Fix_Item " +
														 "and Fix_Id = ? ";
	public static final String FETCH_WORKER_NAME_PER_ID = "select Worker_Name from bx_worker where Fix_Worker_Id = ?";
	public static final String FETCH_STATUS_PER_ID = "select Fix_Status from bx_fix where Fix_Id = ? ";
	public static final String UPDATE_FEEDBACK = "insert into bx_feedback values (?,?,?,?)";
	public static final String FETCH_PROCESSED_LIST = "select Fix_Id from bx_fix where Username = ? ";
	public static final String UPDATE_LOCATION = "update bx_building set Building_Num = ? ";
}

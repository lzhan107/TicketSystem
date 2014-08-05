package com.bx.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bx.bean.BxItem;
import com.bx.bean.BxList;
import com.bx.bean.BxListItem;
import com.bx.bean.BxUser;
import com.bx.dao.BxDAOImpl;
import com.bx.dao.BxGeneralOpDAOImpl;

/**
 * Servlet implementation class BxProcess
 */
public class BxProcess extends HttpServlet {
	
	BxDAOImpl AllBxListOp = null;
	BxDAOImpl getBuilding = null;
	BxDAOImpl getRoom = null;
	BxDAOImpl getGeneralCate = null;
	BxDAOImpl getSpecificCate = null;
	BxDAOImpl getBxItemListPerFixId = null;
	ArrayList allBxListInFix = null;
	ArrayList allBxListInItem = null;
	ArrayList allFeedbackList = null;
	ArrayList allBuildingList = null;
	ArrayList allRoomList = null;
	ArrayList allGeneralCateList = null;
	ArrayList allSpecificCateList = null;
	HttpSession session = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			try {
				process(req,resp);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			try {
				process(req,resp);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, SQLException, ServletException, IOException, ParseException
	{
		String action = req.getParameter("action");
		
		if ("bxmanage".equals(action))
		{
			String type = req.getParameter("type");
			if ("personal".equals(type))
			{
				showPersonalBxList(req,resp);
			}
			else
			{
				showAllBxList(req,resp);
			}
		}
		
		if ("showAllUserBxList".equals(action) || "nextpage".equals(action))
		{
			showAllUserBxList(req,resp);
		}
		
		if ("feedbackmanage".equals(action))
		{
			showAllFeedbackList(req,resp);
		}
		
		if ("fillbx".equals(action))
		{
			fillBxList(req,resp);
		}
		
		
		if ("fillbxsuccess".equals(action))
		{
			//调用保修表单验证filter
			RequestDispatcher rd = req.getRequestDispatcher("BxListInputValidate");
			rd.forward(req,resp);
		}
		
		if ("process".equals(action))
		{
			processBx(req,resp);
		}
		
		if ("processupdate".equals(action))
		{
			updateBx(req,resp);
		}
		
		//这个是学生用户的操作
		if ("checkbxinfo".equals(action))
		{
			checkBxInfo(req,resp);
			
		}
		
		/*if ("modifybx".equals(action))
		{
			RequestDispatcher rd = req.getRequestDispatcher("index1.jsp");
			rd.forward(req, resp);
		}*/
	}
	
	protected void showAllBxList(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, SQLException, ServletException, IOException
	{
		String bxmanagetype = req.getParameter("bxmanagetype");
		ArrayList allBxListInFix = new ArrayList();
		ArrayList allBxListInItem = new ArrayList();
		BxItem bxItemBean = new BxItem();
		BxDAOImpl AllBxListOp = new BxDAOImpl();
		BxDAOImpl getBxItemPerFixItemOp = new BxDAOImpl();
		String Fix_Item = "";
		HttpSession session = req.getSession();
		
		
		allBxListInFix = AllBxListOp.fetchAllBxListInFix(bxmanagetype);
		
		for (int i= 0; i<allBxListInFix.size(); i++)
		{
			Fix_Item = ((BxList)allBxListInFix.get(i)).getFixItem();
			
			bxItemBean = getBxItemPerFixItemOp.fetchAllBxItemPerFixItem(Fix_Item);
			
			allBxListInItem.add(bxItemBean);
		}
		
		
		session.setAttribute("allBxListInFix", allBxListInFix);
		session.setAttribute("allBxListInItem", allBxListInItem);
		
		RequestDispatcher rd = req.getRequestDispatcher("admin_baoxiu_list.jsp");
		rd.forward(req, resp);
	}
	
	protected void showAllFeedbackList(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, SQLException
	{
		ArrayList allFeedbackList = new ArrayList();
		BxDAOImpl AllBxListOp = new BxDAOImpl();
		
		allFeedbackList = AllBxListOp.fetchAllFeedbackList();
		req.setAttribute("allFeedbackList", allFeedbackList);
		RequestDispatcher rd = req.getRequestDispatcher("admin_fankui_list.jsp");
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void fillBxList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException
	{
		
		
		session = req.getSession();
		//String uname = (String) req.getAttribute("uname");
		//System.out.println(uname);
		//String Username = null;
		BxDAOImpl getBuilding = new BxDAOImpl();
		BxDAOImpl getGeneralCate = new BxDAOImpl();
		ArrayList allBuildingList = new ArrayList();
		ArrayList allGeneralCateList = new ArrayList();
		
		if (session.getAttribute("Username")== null)
		{
			//RequestDispatcher rd = req.getRequestDispatcher("index1.jsp");
			//rd.forward(req, resp);
			resp.sendRedirect("index1.jsp");
			return;
		}
		
		//session.setAttribute("uname", uname);
		//req.setAttribute("uname", uname);
		//获得所有building和总的物品分类
		
		allBuildingList = getBuilding.fetchAllBuildingList();
		allGeneralCateList = getGeneralCate.fetchAllCateList();
		session.setAttribute("allBuildingList", allBuildingList);
		session.setAttribute("allGeneralCateList", allGeneralCateList);
		
		
		RequestDispatcher rd = req.getRequestDispatcher("fill_bx_list.jsp");
		rd.forward(req, resp);
	}
	
	protected void showAllUserBxList(HttpServletRequest req,
			HttpServletResponse resp) throws SQLException,
			ClassNotFoundException, ServletException, IOException {
		BxDAOImpl getAllUserBxListAfterFillOps = new BxDAOImpl();
		ArrayList<BxListItem> allBxListAfterFillList = new ArrayList<BxListItem>();
		
		
		
		allBxListAfterFillList = getAllUserBxListAfterFillOps
				.fetchAllUserBxListAfterFill();

		
		//session = req.getSession();
		
		showPaginationUserBxList(req,resp,allBxListAfterFillList);
		
		/*req.setAttribute("allBxListAfterFillList", allBxListAfterFillList);
		System.out.println("jumping to index1.jsp");
		RequestDispatcher rd = req.getRequestDispatcher("index1.jsp");
		rd.forward(req, resp);*/
	}
	
	protected void showPaginationUserBxList (HttpServletRequest req, HttpServletResponse resp, ArrayList allBxListAfterFillList)
	{
		int length = 10;
		int pages = 1;
		int page = 1;
		ArrayList tempBxAfterFillList = new ArrayList();
		
		if (req.getSession().getAttribute("userListPageSession") == null)
		{
			page = 1;
		}
		else
		{
			page = ((Integer) req.getSession().getAttribute("userListPageSession")).intValue();
			page++;
		}
		
		if (allBxListAfterFillList.size()<=10)
		{
			System.out.println("Less than 10 records!");
			Collections.copy(tempBxAfterFillList, allBxListAfterFillList);
		}
		else
		{
			System.out.println("Size------------"+allBxListAfterFillList.size());
			if (allBxListAfterFillList.size()%10 == 0)
			{
				pages = allBxListAfterFillList.size()/10;
			}
			else
			{
				pages = allBxListAfterFillList.size()/10 + 1;
			}
			System.out.println("pages: "+ pages);
			
			if (page ==1)
			{
				System.out.println("---"+page);
				for (int i=0; i<10; i++)
				{
					tempBxAfterFillList.add(i, allBxListAfterFillList.get(i));
				}
			}
			else if (pages-page>=1)
			{
				System.out.println("----------"+page);
				System.out.println("Size------------"+allBxListAfterFillList.size());
				for (int i=(page-1)*10, j=0; i<page*10; i++, j++)
				{
					tempBxAfterFillList.add(j, allBxListAfterFillList.get(i));
				}
			}
			else
			{System.out.println("--------------------------------"+page);
				for (int i=(page-1)*10, j=0; i<allBxListAfterFillList.size(); i++, j++)
				{
					tempBxAfterFillList.add(j, allBxListAfterFillList.get(i));
				}
			}
		}
		System.out.println("jumping to index1.jsp");
		req.getSession().setAttribute("userListPageSession", page);
		req.setAttribute("tempBxAfterFillList", tempBxAfterFillList);
		RequestDispatcher rd = req.getRequestDispatcher("index1.jsp");
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void processBx(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException
	{
		String Fix_Id = req.getParameter("FixId");
		String adminId = (String)req.getSession().getAttribute("adminId");
		String Fix_Item = "";
		String Username = "";
		String Building_Num ="";
		String Item_Cate = "";
		HttpSession utilListSession = req.getSession();
		//String Fix_Worker_Id = "";
		//BxList bxList = new BxList();
		//BxItem bxItem = new BxItem();
		BxUser bxUserInfoForUpdate = new BxUser();
		//BxWorker bxWorker = new BxWorker();
		ArrayList bxBuildingList = new ArrayList();
		ArrayList bxRoomList = new ArrayList();
		ArrayList bxItemCateList = new ArrayList();
		ArrayList bxItemDetailList = new ArrayList();
		ArrayList bxWorkerListForUpdate =  new ArrayList();//最好动态生成worker list
		BxList bxFixInfoListForUpdate = new BxList();
		BxItem bxItemInfoListForUpdate = new BxItem();
		
		
		BxDAOImpl getBxFixInfoForUpdateOp = new BxDAOImpl();
		BxDAOImpl getBxItemInfoForUpdateOp = new BxDAOImpl();
		//BxDAOImpl getBxAdminInfoForUpdateOp = new BxDAOImpl();
		BxDAOImpl getBxUserInfoForUpdateOp = new BxDAOImpl();
		//BxDAOImpl getBxUserInfoForUpdateOp = new BxDAOImpl();
		BxDAOImpl getBxBuildingListForUpdateOp = new BxDAOImpl();
		BxDAOImpl getBxItemCateListForUpdateOp = new BxDAOImpl();
		BxDAOImpl getBxWorkerListForUpdateOp = new BxDAOImpl();
		BxGeneralOpDAOImpl getBxAllRoomListForUpdateOp = new BxGeneralOpDAOImpl();
		BxGeneralOpDAOImpl getBxAllItemDetailListForUpdateOp = new BxGeneralOpDAOImpl();
		
		
		bxFixInfoListForUpdate = getBxFixInfoForUpdateOp.fetchBxFixInfoForUpdateOp(Fix_Id);
		
		
		Fix_Item = bxFixInfoListForUpdate.getFixItem();
		Username = bxFixInfoListForUpdate.getStdName();
		
		bxItemInfoListForUpdate = getBxItemInfoForUpdateOp.fetchBxItemInfoForUpdateOp(Fix_Item);
		bxUserInfoForUpdate = getBxUserInfoForUpdateOp.fetchBxUserInfoForUpdate(Username);
		
		
		Building_Num = bxItemInfoListForUpdate.getBuildingNum();
		Item_Cate = bxItemInfoListForUpdate.getItemCate();
		
		bxRoomList = getBxAllRoomListForUpdateOp.fetchAllRoomList(Building_Num);
		bxItemDetailList = getBxAllItemDetailListForUpdateOp.fetchAllItemDetailList(Item_Cate);
		
		//动态生成building_Num 和 Room_Num,  调用GeneralManage
		//先动态生成building list  和    item_cate list , worker list
		
		
		bxBuildingList = getBxBuildingListForUpdateOp.fetchAllBuildingList();
		bxItemCateList = getBxItemCateListForUpdateOp.fetchAllCateList();
		bxWorkerListForUpdate = getBxWorkerListForUpdateOp.fetchAllBxWorkerNameList();
		
		req.setAttribute("bxFixInfoListForUpdate", bxFixInfoListForUpdate);
		req.setAttribute("bxItemInfoListForUpdate", bxItemInfoListForUpdate);
		req.setAttribute("bxUserInfoForUpdate", bxUserInfoForUpdate);
		utilListSession.setAttribute("bxBuildingList", bxBuildingList);
		utilListSession.setAttribute("bxRoomList", bxRoomList);
		utilListSession.setAttribute("bxItemCateList", bxItemCateList);
		utilListSession.setAttribute("bxItemDetailList", bxItemDetailList);
		utilListSession.setAttribute("bxWorkerListForUpdate", bxWorkerListForUpdate);
		
		RequestDispatcher rd = req.getRequestDispatcher("admin_baoxiu_edit.jsp");
		rd.forward(req, resp);
	}
	
	public void updateBx(HttpServletRequest req, HttpServletResponse resp) throws ParseException, SQLException, ClassNotFoundException, ServletException, IOException
	{
		String fixid = req.getParameter("fixid");
		System.out.println("Fix_ID:   "+fixid);
		String fixstatus = req.getParameter("fixstatus");
		String processtime =req.getParameter("processtime");
		String fixworker = req.getParameter("fixworker");
		String Fix_Worker_Id = "";
		HttpSession getAdminIdSession = req.getSession();
		String adminId = (String)getAdminIdSession.getAttribute("adminId");
		BxList bxListUpdate = new BxList();
		BxDAOImpl getFixWorkerIdOp = new BxDAOImpl();
		BxDAOImpl updateBxListOp = new BxDAOImpl();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date Process_Util_Date = formatter.parse(processtime);
		java.sql.Date Process_Sql_Date = new java.sql.Date(Process_Util_Date.getTime());
		
		Fix_Worker_Id = getFixWorkerIdOp.fetchFixWorkerIdPerName(fixworker);
		
		bxListUpdate.setListId(fixid);
		bxListUpdate.setFixStatus(fixstatus);
		bxListUpdate.setFixWorkerId(Fix_Worker_Id);
		bxListUpdate.setFixStartDate(Process_Sql_Date);
		bxListUpdate.setAdminId(adminId);
		
		updateBxListOp.updateBxList(bxListUpdate);
		
		
		//显示所有保修单
		showAllBxList(req,resp);
	}
	
	public void showPersonalBxList(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ClassNotFoundException, ServletException, IOException
	{
		String Username = (String)req.getSession().getAttribute("Username");
		String uname = (String)req.getSession().getAttribute("uname");
		BxDAOImpl getPersonalBxHistoryOp = new BxDAOImpl();
		ArrayList unfixedBxHistoryList = new ArrayList();
		ArrayList fixedBxHistoryList = new ArrayList();
		ArrayList pendiingList = new ArrayList();
		
		unfixedBxHistoryList = getPersonalBxHistoryOp.fetchConditionalBxList(Username, "未处理");
		fixedBxHistoryList = getPersonalBxHistoryOp.fetchConditionalBxList(Username, "已处理");
		pendiingList = getPersonalBxHistoryOp.fetchConditionalBxList(Username, "正在处理");
		
		req.setAttribute("unfixedBxHistoryList", unfixedBxHistoryList);
		req.setAttribute("fixedBxHistoryList", fixedBxHistoryList);
		req.setAttribute("pendingList", pendiingList);
		
		RequestDispatcher rd = req.getRequestDispatcher("personalpage.jsp");
		rd.forward(req, resp);
	}
	
	public void checkBxInfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException, ClassNotFoundException
	{
		String fixid = req.getParameter("fixid");
		BxList listBean = new BxList();
		BxItem itemBean = new BxItem();
		BxDAOImpl getCheckBxInfoOp = new BxDAOImpl();
		ArrayList checkList = new ArrayList();
		String WorkerName = "";
		
		checkList = getCheckBxInfoOp.fetchBxInfoForCheck(fixid);
		
		itemBean = (BxItem) checkList.get(0);
		listBean = (BxList) checkList.get(1);
		
		WorkerName = getCheckBxInfoOp.fetchWorkerNamePerId(listBean.getFixWorkerId());
		
		req.setAttribute("itemBean", itemBean);
		req.setAttribute("listBean", listBean);
		req.setAttribute("WorkerName", WorkerName);
		RequestDispatcher rd = req.getRequestDispatcher("bxdetail.jsp");
		rd.forward(req, resp);
	}
}

package com.bx.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.sql.*;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bx.bean.BxItem;
import com.bx.bean.BxList;
import com.bx.dao.BxDAOImpl;

/**
 * Servlet implementation class BxListInputValidate
 */
public class BxListInputValidate extends HttpServlet {

	HttpSession session = null;
	BxDAOImpl addBxListOp = null;
	HashMap addBxListMap = null;
	BxDAOImpl getAllUserBxListAfterFillOps = null;
	ArrayList allBxListAfterFillList = null;
	BxList bxList = null;
	BxItem bxItem = null;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			process(req, resp);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			process(req, resp);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp)
			throws ParseException, SQLException, ClassNotFoundException,
			ServletException, IOException {
		System.out.println("Validate Sucessfully");
		System.out.println(req.getParameter("uname"));

		HttpSession session = req.getSession();
		// Date date = new Date();

		System.out.println("Come out of Filter");
		String uname = req.getParameter("uname");// 没有用到
		System.out.println(uname);
		String Username = req.getParameter("Username");
		System.out.println(Username);
		String Building_Num = (String) session.getAttribute("Building_Num");//
		System.out.println(Building_Num);
		String Room_Num = (String) session.getAttribute("Room_Num");//
		System.out.println(Room_Num);
		String Item_Cate = (String) session.getAttribute("Item_Cate");//
		String Item_Detail = (String) session.getAttribute("Item_Detail");//
		System.out.println(Item_Cate);
		String Item_Desc = req.getParameter("Item_Desc");//
		System.out.println(Item_Desc);
		String expecTime = (String)req.getParameter("expecTime");
		
		String expecTimeTemp = expecTime.replace("-", "");
		
		

		java.sql.Date Epec_Fix_Date_sql = null;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date Epec_Fix_Date_sql_Util = formatter.parse(expecTime);
		
		Epec_Fix_Date_sql = new java.sql.Date(Epec_Fix_Date_sql_Util.getTime());
		
		

		String preFixId = "BX";
		String preFixItem = "IM";
		String tempFixId = expecTimeTemp;
		System.out.println(expecTimeTemp+"UIOUOUIOUD)*()*()*)");
		String FixIdTail = uname.substring(7);

		String Fix_Id = preFixId.concat(tempFixId).concat(FixIdTail);
		String Fix_Item = preFixItem.concat(tempFixId).concat(FixIdTail);

		BxDAOImpl addBxListOp = new BxDAOImpl();
		HashMap addBxListMap = new HashMap();
		String Fix_Status = "未处理";

		addBxListMap.put("Building_Num", Building_Num);
		addBxListMap.put("Room_Num", Room_Num);
		addBxListMap.put("Item_Cate", Item_Cate);
		addBxListMap.put("Item_Detail", Item_Detail);
		addBxListMap.put("Item_Desc", Item_Desc);
		addBxListMap.put("Fix_Item", Fix_Item);
		addBxListMap.put("Fix_Id", Fix_Id);
		addBxListMap.put("Epec_Fix_Date", Epec_Fix_Date_sql);
		addBxListMap.put("Fix_Status", Fix_Status);
		addBxListMap.put("Username", Username);

		addBxListOp.addBxList(addBxListMap);

		/*
		 * 
		 * 这里应该执行查询将保修结果显示出来 然后在跳到index1.jsp去
		 */

		// showAllBxList(req, resp);
		resp.sendRedirect("fill_list_success.jsp");
	}

}

package com.bx.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bx.bean.BxFeedback;
import com.bx.bean.BxRoom;
import com.bx.dao.BxGeneralOpDAOImpl;

/**
 * Servlet implementation class GeneralManage
 */

public class GeneralManage extends HttpServlet {
	BxRoom bxRoom = null;
	ArrayList allRoomList = null;
	BxGeneralOpDAOImpl getAllRoomList = null;
	BxGeneralOpDAOImpl getAllItemDetailList = null;
	HttpSession session = null;
	
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			process(req,resp);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			process(req,resp);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void process(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, SQLException, ServletException, IOException
	{
		String action = req.getParameter("action");
		
		
		if ("fetchRoomList".equals(action))
		{
			getRoomListProcess(req,resp);
		}
		
		if ("fetchItemDetailList".equals(action))
		{
			getItemDetailListProcess(req,resp);
		}
		
		if ("getSelectedRoom".equals(action))
		{
			getSelectedRoom(req,resp);
		}
		
		if ("getSelectedItemDetail".equals(action))
		{
			getSelectedItemDetail(req,resp);
		}
		
		if ("feedback".equals(action))
		{
			feedbackProcess(req,resp);
		}
		
		if ("processedlist".equals(action))
		{
			getProcessedList(req,resp);
		}
	}
	
	public void getRoomListProcess(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, SQLException, ServletException, IOException
	{
		String Building_Num = req.getParameter("Building_Num");
		BxGeneralOpDAOImpl getAllRoomList = new BxGeneralOpDAOImpl();
		ArrayList allRoomList = new ArrayList();
		HttpSession session = req.getSession();
		
		allRoomList = getAllRoomList.fetchAllRoomList(Building_Num);
		
		String type = req.getParameter("type");
		
		if ("edit".equals(type))
		{
			session.setAttribute("Building_Num_Edit", Building_Num);
			session.setAttribute("allRoomList", allRoomList);
			RequestDispatcher rd = req.getRequestDispatcher("admin_baoxiu_edit.jsp");
			rd.forward(req, resp);
		}
		else
		{
			session.setAttribute("Building_Num", Building_Num);
			session.setAttribute("allRoomList", allRoomList);
			RequestDispatcher rd = req.getRequestDispatcher("fill_bx_list.jsp");
			rd.forward(req, resp);
		}
		
	}
	
	
	public void getItemDetailListProcess(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, SQLException, ServletException, IOException
	{
		String Item_Cate = req.getParameter("Item_Cate");
		System.out.println("Item_Cate:"+Item_Cate);
		BxGeneralOpDAOImpl getAllItemDetailList = new BxGeneralOpDAOImpl();
		ArrayList allItemDetailList = new ArrayList();
		HttpSession session = req.getSession();
		
		allItemDetailList = getAllItemDetailList.fetchAllItemDetailList(Item_Cate);
		
		String type = req.getParameter("type");
		
		
		if ("edit".equals(type))
		{
			session.setAttribute("Item_Cate_Edit",Item_Cate);
			System.out.println("Item Detail Called");
			session.setAttribute("allItemDetailList", allItemDetailList);
			RequestDispatcher rd = req.getRequestDispatcher("admin_baoxiu_edit.jsp");
			rd.forward(req, resp);
		}
		else
		{
			session.setAttribute("Item_Cate",Item_Cate);
			session.setAttribute("allItemDetailList", allItemDetailList);
			RequestDispatcher rd = req.getRequestDispatcher("fill_bx_list.jsp");
			rd.forward(req, resp);
		}
		
	}
	
	public void getSelectedRoom (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String Room_Num = req.getParameter("Room_Num");
		session = req.getSession();
		
		String type = req.getParameter("type");
		
		
		if ("edit".equals(type))
		{
			session.setAttribute("Room_Num_Edit", Room_Num);
			RequestDispatcher rd = req.getRequestDispatcher("admin_baoxiu_edit.jsp");
			rd.forward(req, resp);
		}
		else
		{
			session.setAttribute("Room_Num", Room_Num);
			RequestDispatcher rd = req.getRequestDispatcher("fill_bx_list.jsp");
			rd.forward(req, resp);
		}
		
	}
	
	public void getSelectedItemDetail (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String Item_Detail = req.getParameter("Item_Detail");
		session = req.getSession();
		
		String type = req.getParameter("type");
		
		if ("edit".equals(type))
		{
			session.setAttribute("Item_Detail_Edit", Item_Detail);
			RequestDispatcher rd = req.getRequestDispatcher("admin_baoxiu_edit.jsp");
			rd.forward(req, resp);
		}
		else
		{
			session.setAttribute("Item_Detail", Item_Detail);
			RequestDispatcher rd = req.getRequestDispatcher("fill_bx_list.jsp");
			rd.forward(req, resp);
		}
	}
	
	public void feedbackProcess (HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException, ClassNotFoundException, ServletException
	{
		System.out.println(req.getQueryString());
		String fixid = req.getParameter("fixid");
		String status = "";
		BxGeneralOpDAOImpl getBxListStatusOp = new BxGeneralOpDAOImpl();
		BxGeneralOpDAOImpl updateFeedbackOp = new BxGeneralOpDAOImpl();
		
		status = getBxListStatusOp.fetchBxListStatusPerId(fixid);
		System.out.println(status);
		
		if ("未处理".equals(status) || "正在处理".equals(status))
		{
			resp.sendRedirect("alertmessage.jsp?message=feedbackfail&fixid="+fixid);
			return;
		}
		else
		{
			Date utilFeedDate = new Date();
			java.sql.Date sqlFeedDate = new java.sql.Date (utilFeedDate.getTime());
			String feedback = req.getParameter("feedback");
			String feedId = fixid.replace("BX", "FD");
			BxFeedback bxFeedbackBean = new BxFeedback();
			
			bxFeedbackBean.setFeedId(feedId);
			bxFeedbackBean.setFixId(fixid);
			bxFeedbackBean.setFixEval(feedback);
			bxFeedbackBean.setEvalDate(sqlFeedDate);
			
			updateFeedbackOp.updateFeedback(bxFeedbackBean);
			
			RequestDispatcher rd = req.getRequestDispatcher("index1.jsp");
			rd.forward(req, resp);
		}
	}
	
	public void getProcessedList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String Username = req.getParameter("Username");
		ArrayList processedList = new ArrayList();
		BxGeneralOpDAOImpl getProcessedListOp = new BxGeneralOpDAOImpl();
		
		try {
			processedList = getProcessedListOp.fetchProcessedList(Username);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("processedList", processedList);
		RequestDispatcher rd = req.getRequestDispatcher("personalpage.jsp");
		rd.forward(req, resp);
	}
}

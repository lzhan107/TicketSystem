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

import com.bx.bean.BxUser;
import com.bx.dao.BxDAOImpl;

/**
 * Servlet implementation class UserManage
 */

public class UserManage extends HttpServlet {
	
	BxDAOImpl allUserListOp = null;
	ArrayList allUserList = null;
	BxDAOImpl addUserOp = null;
	BxUser newUserInfo = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			process(req,resp);
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
			process(req,resp);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, SQLException, ServletException, IOException
	{
		String action = req.getParameter("action");
		
		if ("userlist".equals(action))
		{
			showAllUser(req,resp);
		}
		
		if ("adduserinfo".equals(action))
		{
			addUser(req,resp);
		}
	}
	
	protected void showAllUser(HttpServletRequest req, HttpServletResponse resp) throws ClassNotFoundException, SQLException
	{
		ArrayList allUserList = new ArrayList();
		BxDAOImpl allUserListOp = new BxDAOImpl();
		
		allUserList = allUserListOp.fetchAllUserList();
		req.setAttribute("allUserList", allUserList);
		RequestDispatcher rd = req.getRequestDispatcher("admin_user_list.jsp");
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, ClassNotFoundException, SQLException
	{
		String uname = req.getParameter("uname");
		String Username = req.getParameter("Username");
		String Password = req.getParameter("Password");
		String Repassword = req.getParameter("Repassword");
		int loginCount = 1;
		Date regTime = new Date();
		BxDAOImpl addUserOp = new BxDAOImpl();
		BxUser newUserInfo = new BxUser();
		//HttpSession session = req.getSession();
		
		if (null == uname || "".equals(uname))
		{
			RequestDispatcher rd = req.getRequestDispatcher("admin_user_add.jsp");
			rd.forward(req, resp);
			return;
		}
		
		if (null == Username || "".equals(Username))
		{
			RequestDispatcher rd = req.getRequestDispatcher("admin_user_add.jsp");
			rd.forward(req, resp);
			return;
		}
		
		if (null == Password || "".equals(Password))
		{
			RequestDispatcher rd = req.getRequestDispatcher("admin_user_add.jsp");
			rd.forward(req, resp);
			return;
		}
		
		if (null == Repassword || "".equals(Repassword))
		{
			RequestDispatcher rd = req.getRequestDispatcher("admin_user_add.jsp");
			rd.forward(req, resp);
			return;
		}
		
		if (!Password.equals(Repassword))
		{
			RequestDispatcher rd = req.getRequestDispatcher("admin_user_add.jsp");
			rd.forward(req, resp);
			return;
		}
		
		
		java.sql.Date sqlRegTime = new java.sql.Date(regTime.getTime());
		newUserInfo.setUname(uname);
		newUserInfo.setUsername(Username);
		newUserInfo.setPassword(Password);
		newUserInfo.setLoginCount(loginCount);
		newUserInfo.setRegTime(sqlRegTime);
		
		
		addUserOp.addNewUser(newUserInfo);
		showAllUser(req,resp);
	}
}

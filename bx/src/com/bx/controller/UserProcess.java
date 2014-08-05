package com.bx.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bx.bean.BxUser;
import com.bx.dao.BxDAOImpl;

/**
 * Servlet implementation class UserProcess
 */

public class UserProcess extends HttpServlet {

	BxDAOImpl userRegOp = null;
	BxDAOImpl userValidationOp = null;
	int userLoginCount;
	BxUser bxUser = null;
	BxUser bxUserCredentials = null;
	HttpSession session = null;
	ArrayList allUserCrenList = null;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			process(req, resp);
		} catch (ParseException e) {
			e.printStackTrace();
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
			process(req, resp);
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, ParseException,
			ClassNotFoundException, SQLException {
		String action = req.getParameter("action");
		//String uname = (String) req.getSession().getAttribute("uname");
		//System.out.println("First Reg Uname"+uname);
		String Username = (String)req.getSession().getAttribute("Username");
		
		if ("uservalidation".equals(action)) {
			if (null != Username)
			{
				//User already Login
				System.out.println("User already login");
				RequestDispatcher rd = req.getRequestDispatcher("index1.jsp");
				rd.forward(req, resp);
				return;
			}
			
			//req.setAttribute("uname", uname);
			RequestDispatcher rd = req
					.getRequestDispatcher("user_validation.jsp");
			rd.forward(req, resp);
		}

		if ("userregistrationRequest".equals(action)) {
			
			//req.setAttribute("unameTmp", uname);
			RequestDispatcher rd = req.getRequestDispatcher("user_reg.jsp");
			rd.forward(req, resp);
		}

		if ("userregistration".equals(action)) {
			userRegProcess(req, resp);
		}

		if ("userlogout".equals(action)) {
			// Remove User Session
			userLogoutProcess(req, resp);
		}

		// 判断用户是否登录
		if ("userlogin".equals(action)) {
			System.out.println("User login");
			userLoginProcess(req, resp);
		}
	}

	protected void userLoginProcess(HttpServletRequest req,
			HttpServletResponse resp) throws SQLException,
			ClassNotFoundException, ServletException, IOException {
		String uname = req.getParameter("uname");//从花旗絮语跳过来，可以获得手机号
		String Password = req.getParameter("Password");
		BxDAOImpl userValidationOp = new BxDAOImpl();
		ArrayList allUserCrenList = new ArrayList();
		BxUser bxUserCredentials = new BxUser();
		session = req.getSession();

		allUserCrenList = userValidationOp.fetchCrendentials();

		for (int i = 0; i < allUserCrenList.size(); i++) {
			bxUserCredentials = (BxUser) allUserCrenList.get(i);
			if (uname.equals(bxUserCredentials.getUname())) {

				if (Password.equals(bxUserCredentials.getPassword())) {
					// 用户名和密码均正确
					System.out.println("Username & password correct");

					if (null == session.getAttribute("Username")) {
						session.setAttribute("Username", bxUserCredentials
								.getUsername());
						session.setAttribute("uname", uname);
						System.out.println("uname:"+uname);
						break;
					}

					if (!bxUserCredentials.getUsername().equals(
							session.getAttribute("Username"))) {
						session.setAttribute("Username", bxUserCredentials
								.getUsername());
						session.setAttribute("uname", uname);
						System.out.println("uname:"+uname);
						break;
					}
				} else {
					continue;
				}
			} else {
				continue;
			}
		}

		RequestDispatcher rd = req.getRequestDispatcher("index1.jsp");
		rd.forward(req, resp);
	}

	protected void userRegProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException,
			ParseException, ClassNotFoundException, SQLException {
		String uname = req.getParameter("uname");
		String Username = req.getParameter("Username");
		String Password = req.getParameter("Password");
		java.util.Date regtime = new java.util.Date();

		System.out.println(regtime);
		userLoginCount = 1;
		BxDAOImpl userRegOp = new BxDAOImpl();
		BxUser bxUser = new BxUser();
		session = req.getSession();

		bxUser.setUname(uname);
		bxUser.setUsername(Username);
		System.out.println("====="+Username);
		bxUser.setPassword(Password);
		bxUser.setRegTime(regtime);
		bxUser.setLoginCount(userLoginCount);

		userRegOp.addNewRegUser(bxUser);
		
		session.setAttribute("uname", uname);
		session.setAttribute("Username", Username);
		RequestDispatcher rd = req.getRequestDispatcher("index1.jsp");
		rd.forward(req, resp);
	}

	protected void userLogoutProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		session = req.getSession();
		session.removeAttribute("Username");
		System.out.println("Logout, session removed");
		RequestDispatcher rd = req.getRequestDispatcher("index1.jsp");
		rd.forward(req, resp);
	}
}

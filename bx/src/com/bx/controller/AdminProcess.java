package com.bx.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bx.bean.BxAdmin;
import com.bx.dao.BxDAOImpl;

/**
 * Servlet implementation class AdminLoginProcess
 */
// @WebServlet("/AdminLoginProcess")
public class AdminProcess extends HttpServlet {

	ArrayList adminInfoList = null;
	BxAdmin[] bxAdmin = null;
	BxDAOImpl checkAdminInfo = null;
	HttpSession session = null;
	BxAdmin bxAdminIndentity = null;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			process(req, resp);
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
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, ClassNotFoundException,
			SQLException {

		String action = req.getParameter("action");

		if ("adminlogin".equals(action)) {
			adminLoginProcess(req, resp);
		}

		if ("logout".equals(action)) {
			adminLogoutProcess(req, resp);
		}

	}

	protected void adminLoginProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {

		String adminId = req.getParameter("adminId");
		String adminPassword = req.getParameter("adminPassword");
		String adminUsername = "";
		HttpSession session = req.getSession();
		int sizeOfAdminInfoList;
		boolean flag = false;

		/*
		 * 
		 * 此处要从数据库获取管理员用户名和密码，做对比!
		 */

		if ("".equals(adminId)) {
			System.out.println("adminId null");
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);
		} else if ("".equals(adminPassword)) {
			System.out.println("password null");
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.forward(req, resp);
		} else {
			BxDAOImpl checkAdminInfo = new BxDAOImpl();
			ArrayList adminInfoList = new ArrayList();

			try {
				adminInfoList = checkAdminInfo.fetchAdminInfo();

				sizeOfAdminInfoList = adminInfoList.size();

				BxAdmin[] bxAdmin = new BxAdmin[sizeOfAdminInfoList];

				for (int i = 0; i < adminInfoList.size(); i++) {
					bxAdmin[i] = (BxAdmin) adminInfoList.get(i);
					System.out.println("Admin Id :"
							+ bxAdmin[i].getAdminId());
					System.out
							.println("Admin Pwd: " + bxAdmin[i].getAdminPwd());
				}

				for (int i = 0; i < bxAdmin.length; i++) {
					if (adminId.equals(bxAdmin[i].getAdminId())) {
						if (adminPassword.equals(bxAdmin[i].getAdminPwd())) {
							flag = true;
							//判断管理员session
							adminUsername = bxAdmin[i].getAdminName();
							System.out.println("Username & password correct");
							if (!adminUsername.equals(session
									.getAttribute("adminName"))) {
								session
										.setAttribute("adminName",
												adminUsername);
								session.setAttribute("adminId", adminId);
							}

							System.out.println("flag:" + flag);
							RequestDispatcher rd = req
									.getRequestDispatcher("admin_index.jsp");
							rd.forward(req, resp);
						} else {
							continue;
						}
					} else {
						continue;
					}
				}

				if (flag == false) {
					RequestDispatcher rd = req
							.getRequestDispatcher("index.jsp");
					rd.forward(req, resp);
				}

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	protected void adminLogoutProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("student_index.jsp");
		rd.forward(req, resp);
	}

}

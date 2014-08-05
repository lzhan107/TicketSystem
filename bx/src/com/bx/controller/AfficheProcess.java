package com.bx.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bx.bean.BxAdmin;
import com.bx.bean.BxAffiche;
import com.bx.dao.BxDAOImpl;

/**
 * Servlet implementation class AfficheProcess
 */
//@WebServlet("/AfficheProcess")
public class AfficheProcess extends HttpServlet {

	BxAffiche ba = null;
	BxDAOImpl fetchAllAffiche = null;
	BxDAOImpl insertAfficheOp = null;
	BxDAOImpl getAdminIdOp = null;
	ArrayList allAffiche = null;

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

		// 发布公告
		if ("pubaffiche".equals(action)) {
			pubAfficheProcess(req, resp);
		}
		// 显示所有公告
		if ("manageaffiche".equals(action)) {
			pubAllAfficheContentProcess(req, resp);
		}
		// 插入公告
		if ("pubaffichecontent".equals(action)) {
			pubAfficheContentProcess(req, resp);
		}

	}

	protected void pubAfficheProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req
				.getRequestDispatcher("admin_affiche_add.jsp");
		rd.forward(req, resp);
	}

	protected void pubAfficheContentProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ClassNotFoundException,
			SQLException, ServletException, IOException {
		/* 向数据库插入公告内容 */

		String afficheId = "";
		String afficheTitle = req.getParameter("afficheTitle");
		String afficheCont = req.getParameter("afficheCont");
		Date afficheDate = null;
		HttpSession session = req.getSession();
		String adminName = (String) session.getAttribute("adminName");  //adminName 在AdminProcess里已经set了,通过adminName获取adminId
		BxAffiche ba = new BxAffiche();
		BxDAOImpl insertAfficheOp = new BxDAOImpl();
		BxDAOImpl getAdminIdOp = new BxDAOImpl();

		String adminId = getAdminIdOp.getAdminId(adminName);
		String affPrefix = "AFF";
		DateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		afficheDate = new Date();
		
		System.out.println("           "+afficheDate);
		
		String timeString = formatter.format(afficheDate);
		System.out.println("Time String:"+ timeString);
		String tailString = adminId.substring(1);
		System.out.println("Tail String: "+ tailString);
		
		afficheId = affPrefix.concat(timeString).concat(tailString);
		
		System.out.println("afficheId :" + afficheId);
		
		
		ba.setAfficheId(afficheId);
		ba.setAdminId(adminId);
		ba.setAfficheTitle(afficheTitle);
		ba.setAfficheCont(afficheCont);
		ba.setAfficheDate(afficheDate);

		insertAfficheOp.insertAffiche(ba);
		//填完公告以后，然后将所有公告显示出来
		pubAllAfficheContentProcess(req, resp);
	}

	protected void pubAllAfficheContentProcess(HttpServletRequest req,
			HttpServletResponse resp) throws ClassNotFoundException,
			SQLException, ServletException, IOException {
		/* 获取数据库公告内容 */

		ArrayList allAffiche = new ArrayList();
		BxDAOImpl fetchAllAffiche = new BxDAOImpl();
		BxDAOImpl fetchAdminNamePerIdOp = new BxDAOImpl();
		ArrayList adminNameList = new ArrayList();
		String adminId = "";
		BxAdmin adminName = new BxAdmin();
		HttpSession session = req.getSession();

		allAffiche = fetchAllAffiche.getPublishedContent();

		//get AdminName
		
		for (int i=0; i<allAffiche.size(); i++)
		{
			adminId = ((BxAffiche)allAffiche.get(i)).getAdminId();
			
			adminName = (BxAdmin) fetchAdminNamePerIdOp.fetchAdminNamePerId(adminId);
			
			adminNameList.add(adminName);
		}
		
		session.setAttribute("allAffiche", allAffiche);
		session.setAttribute("adminNameList", adminNameList);
		RequestDispatcher rd = req.getRequestDispatcher("admin_affiche.jsp");
		rd.forward(req, resp);
	}
}

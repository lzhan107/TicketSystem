package com.bx.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bx.dao.BxDAOImpl;
import com.bx.dao.BxGeneralOpDAOImpl;

/**
 * Servlet implementation class CategorizationManage
 */

public class CategorizationManage extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		process(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		process(req,resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String action = req.getParameter("action");
		
		if ("locations".equals(action))
		{
			locationCateProcess(req,resp);
		}
		if ("detaillocation".equals(action))
		{
			locationDetailProcess(req,resp);
		}
		if ("updatelocation".equals(action))
		{
			updateLocationProcess(req,resp);
		}
		if ("items".equals(action))
		{
			itemsCateProcess(req, resp);
		}
		if ("detailitems".equals(action))
		{
			itemDetailProcess(req,resp);
		}
	}
	
	public void locationCateProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		ArrayList allLocations = new ArrayList();
		BxDAOImpl getAllDeptLocationsOp = new BxDAOImpl();
		
		
		try {
			allLocations = getAllDeptLocationsOp.fetchAllBuildingList();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("allLocations", allLocations);
		RequestDispatcher rd = req.getRequestDispatcher("location_categorization.jsp");
		rd.forward(req, resp);
	}
	
	public void locationDetailProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		String locationid = req.getParameter("locationid");
		ArrayList detailLocations = new ArrayList();
		BxGeneralOpDAOImpl getDetailLocationsOp = new BxGeneralOpDAOImpl();
		
		try {
			detailLocations = getDetailLocationsOp.fetchAllRoomList(locationid);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("detailLocations", detailLocations);
		RequestDispatcher rd = req.getRequestDispatcher("detail_location.jsp");
		rd.forward(req, resp);
	}
	
	public void updateLocationProcess(HttpServletRequest req, HttpServletResponse resp)
	{
		String locationid = req.getParameter("locationid");
		BxGeneralOpDAOImpl updateLocationOp = new BxGeneralOpDAOImpl();
		
		try {
			updateLocationOp.updateLocation(locationid);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			//修改完以后转向原来页面
			locationCateProcess(req,resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void itemsCateProcess(HttpServletRequest req, HttpServletResponse resp)
	{
		ArrayList allItems = new ArrayList();
		BxDAOImpl getAllItemsOp = new BxDAOImpl();
		
		try {
			allItems = getAllItemsOp.fetchAllCateList();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("allItems", allItems);
		RequestDispatcher rd = req.getRequestDispatcher("item_categorization.jsp");
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void itemDetailProcess(HttpServletRequest req, HttpServletResponse resp)
	{
		String itemId = req.getParameter("itemid");
		ArrayList itemDetails = new ArrayList();
		BxGeneralOpDAOImpl getItemDetailOp = new BxGeneralOpDAOImpl();
		
		try {
			itemDetails = getItemDetailOp.fetchAllItemDetailList(itemId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("itemDetails", itemDetails);
		RequestDispatcher rd = req.getRequestDispatcher("detail_item.jsp");
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

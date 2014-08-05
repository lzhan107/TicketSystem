package com.bx.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bx.util.BxMessageUtil;

/**
 * Servlet Filter implementation class BxListInputValidateFilter
 */

public class BxListInputValidateFilter implements Filter {

	ArrayList<String> errorMessageList = null;
	//BxMessageUtil bxMessageUtil = null;
	
    /**
     * Default constructor. 
    public BxListInputValidateFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		System.out.println("doFilter Called");
		System.out.println(req.getRemoteAddr());
		
		
		String uname = req.getParameter("uname");
		System.out.println("---------------"+uname);
		String Username = req.getParameter("Username");
		System.out.println(Username);
		String Building_Num = (String)session.getAttribute("Building_Num");
		System.out.println(Building_Num);
		String Room_Num = (String)session.getAttribute("Room_Num");
		System.out.println(Room_Num);
		String Item_Cate = (String) session.getAttribute("Item_Cate");
		System.out.println(Item_Cate);
		String Item_Detail = (String)session.getAttribute("Item_Detail");
		System.out.println(Item_Detail);
		//String Expec_Fix_Date = req.getParameter("Expec_Fix_Date");
		//System.out.println(Expec_Fix_Date);
		String Contact_Num = uname;
		System.out.println(Contact_Num);
		String Item_Desc = req.getParameter("Item_Desc");
		System.out.println(Item_Desc);
		String expecTime = req.getParameter("expecTime");
		
		ArrayList<String> errorMessageList = new ArrayList<String>();

		
		
		
		if (uname == null || "".equals(uname))
		{
			errorMessageList.add(BxMessageUtil.UNAME_NULL);
		}
		
		if (null == Username || "".equals(Username))
		{
			errorMessageList.add(BxMessageUtil.USERNAME_NULL);
		}
		
		if (null == Building_Num || "".equals(Building_Num))
		{
			errorMessageList.add(BxMessageUtil.BUILDING_NUMBER_NULL);
		}
		
		if (null == Room_Num || "".equals(Room_Num))
		{
			errorMessageList.add(BxMessageUtil.ROOM_NUMBER_NULL);
		}
		
		if (null == Item_Cate || "".equals(Item_Cate))
		{
			errorMessageList.add(BxMessageUtil.ITEM_CATE_NULL);
		}
		
		if (null == Item_Detail || "".equals(Item_Detail))
		{
			errorMessageList.add(BxMessageUtil.ITEM_DETAIL_NULL);
		}
		
		
		if (null == Item_Desc || "".equals(Item_Desc))
		{
			errorMessageList.add(BxMessageUtil.ITEM_DESC_NULL);
		}
		
		if (null == expecTime || "".equals(expecTime))
		{
			errorMessageList.add(BxMessageUtil.DATE_NULL);
		}
		
		if (errorMessageList.size()==0)
		{
			chain.doFilter(request, response);
		}else
		{
			System.out.println("Error Appears");
			errorMessageList.add(BxMessageUtil.EROOR_NOTICE);
			req.setAttribute("errorMessageList", errorMessageList);
			
			RequestDispatcher rd = req.getRequestDispatcher("fill_bx_list.jsp");
			rd.forward(req, resp);
		}
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
		System.out.println("inti filter");
	}

}

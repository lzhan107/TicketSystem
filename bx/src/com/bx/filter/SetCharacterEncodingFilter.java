package com.bx.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * Servlet Filter implementation class SetCharacterEncodingFilter
 */
public class SetCharacterEncodingFilter implements Filter {

	/*
	 * protected String encoding = null; protected FilterConfig filterConfig =
	 * null; protected boolean ignore = true;
	 * 
	 * public SetCharacterEncodingFilter() { // TODO Auto-generated constructor
	 * stub }
	 *//**
	 * @see Filter#destroy()
	 */
	/*
	 * public void destroy() { this.encoding = null; this.filterConfig = null; }
	 *//**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	/*
	 * public void doFilter(ServletRequest request, ServletResponse response,
	 * FilterChain chain) throws IOException, ServletException {
	 * 
	 * if (ignore || (request.getCharacterEncoding() == null)) { String encoding
	 * = selectEncoding(request); if (encoding != null)
	 * request.setCharacterEncoding(encoding); }
	 * 
	 * chain.doFilter(request, response); }
	 *//**
	 * @see Filter#init(FilterConfig)
	 */
	/*
	 * public void init(FilterConfig fConfig) throws ServletException {
	 * this.filterConfig = filterConfig; this.encoding =
	 * filterConfig.getInitParameter("encoding"); String value =
	 * filterConfig.getInitParameter("ignore"); if (value == null) this.ignore =
	 * true; else if (value.equalsIgnoreCase("true")) this.ignore = true; else
	 * if (value.equalsIgnoreCase("yes")) this.ignore = true; else this.ignore =
	 * false; }
	 * 
	 * protected String selectEncoding(ServletRequest request) { return
	 * (this.encoding); }
	 */

	private FilterConfig filterConfig = null;

	public SetCharacterEncodingFilter() {
	}

	public void init(FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// Setting the character set for the request
		request.setCharacterEncoding("GBK");

		// pass the request on
		chain.doFilter(request, response);

		// Setting the character set for the response
		response.setContentType("text/html; charset=GBK");
	}
	
	public void destroy()
	{
		this.filterConfig = null;
	}
}

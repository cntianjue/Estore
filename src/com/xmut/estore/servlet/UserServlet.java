package com.xmut.estore.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.xmut.estore.domain.User;
import com.xmut.estore.service.BalanceService;
import com.xmut.estore.service.LoginService;
import com.xmut.estore.service.RegisterService;
import com.xmut.estore.service.UpdateService;
import com.xmut.estore.service.UserService;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String oper = req.getParameter("oper");
		if (oper.equals("exit")) {
			System.out.println("准备退出。。。。");
			HttpSession ss = req.getSession();
			ss.removeAttribute("account");
//			// 设置名字属性为null
//			ss.removeAttribute("name");
			resp.sendRedirect("computers.jsp");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String result = "";
		String balance = "";
		String oper = request.getParameter("oper");

		if (oper.equals("Login")) {
			String account = request.getParameter("account");
			String pass = request.getParameter("pass");
			String pic = request.getParameter("picture");
			Object rpic = request.getSession().getAttribute("pic");
			try {
				result = new LoginService().login(account, pass, pic, rpic);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (result.contains("登录成功")) {
				HttpSession session = request.getSession(true);
				session.setAttribute("account", account);

			}
			ObjectMapper ob = new ObjectMapper();
			ob.writeValue(response.getOutputStream(), result);

		} else if (oper.equals("Register")) {
			String account = request.getParameter("account");
			String pass = request.getParameter("pass");
			String pic = request.getParameter("picture");
			Object rpic = request.getSession().getAttribute("pic");
			String rpass = request.getParameter("rpass");
			try {
				result = new RegisterService().register(account, pass, rpic, pic, rpass);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ObjectMapper ob = new ObjectMapper();
			ob.writeValue(response.getOutputStream(), result);
//修改密码

		} else if (oper.equals("update")) {
			String account = request.getParameter("account");
			String pass = request.getParameter("pass");
			result = new UpdateService().update(account, pass);
			ObjectMapper ob = new ObjectMapper();
			ob.writeValue(response.getOutputStream(), result);

		} else if (oper.equals("exit")) {

			HttpSession ss = request.getSession();
			ss.removeAttribute("account");
//			// 设置名字属性为null
//			ss.removeAttribute("name");
			response.sendRedirect("computerServlet?method=getComputers");

		} else if (oper.equals("balance")) {
			String account = (String) request.getSession().getAttribute("account");
			try {
				balance = new BalanceService().balance(account);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ObjectMapper ob = new ObjectMapper();
			ob.writeValue(response.getOutputStream(), balance);

		}

//		// 获取 username 请求参数的值
//		String username = request.getParameter("username");
//
////		调用 UserService 的 getUser(username) 获取User 对象：要求 trades 是被装配好的，而且每一个 Trrade 对象的 items 也被装配好
//		User user = userService.getUserWithTrades(username);
//
////		把 User 对象放入到 request 中
//		if (user == null) {
//			response.sendRedirect(request.getServletPath() + "/error-1.jsp");
//			return;
//		}
//
//		request.setAttribute("user", user);
//
////		转发页面到 /WEB-INF/pages/trades.jsp
//		request.getRequestDispatcher("/WEB-INF/pages/trades.jsp").forward(request, response);

	}

}

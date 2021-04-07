package com.anish.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateCartServlet ",urlPatterns = "/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cartid=Integer.parseInt(req.getParameter("cartid"));
		int qunatity=Integer.parseInt(req.getParameter("qty"));
		PrintWriter out=resp.getWriter();
		System.out.println(cartid+qunatity);
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
			PreparedStatement ps=con.prepareStatement("update cartitems set price_quantity=? where cartid=?");
			ps.setInt(1, qunatity);
			ps.setInt(2, cartid);
			ps.executeUpdate();
			out.println(""
					+ "<script>"
					+ "alert('qunatity added successfully!!!');"
					+ "window.location='cart.jsp';"
					+ "</script>");
		}
		catch (Exception e) 
		{
			out.println(e);
		}
	}
}

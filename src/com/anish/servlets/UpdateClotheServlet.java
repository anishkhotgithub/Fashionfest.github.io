package com.anish.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UpdateClotheServlet")
public class UpdateClotheServlet extends HttpServlet 
{

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int clothesid=Integer.parseInt(req.getParameter("clothesid"));
		String brandname=req.getParameter("brandname");
		String category=req.getParameter("category");
		float price=Float.parseFloat(req.getParameter("price"));
		float pricestrike=Float.parseFloat(req.getParameter("pricestrike"));
		String gender=req.getParameter("gender");
		String description=req.getParameter("description");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
			PreparedStatement ps=con.prepareStatement("update clothes set brandname=?,category=?,price=?,pricestrike=?,gender=?,description=? where clothesid=?");
			ps.setString(1, brandname);
			ps.setString(2, category);
			ps.setFloat(3, price);
			ps.setFloat(4, pricestrike);
			ps.setString(5, gender);
			ps.setString(6, description);
			ps.setInt(7, clothesid);
			ps.executeUpdate();
			resp.sendRedirect("clothes.jsp");
		}
		catch(Exception e)
		{
			PrintWriter out=resp.getWriter();
			out.println(e);
		}

	}

}
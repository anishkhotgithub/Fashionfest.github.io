package com.anish.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name="AddBrandServlet",urlPatterns = "/AddBrandServlet")
@MultipartConfig(maxFileSize = 9999999999L)
public class AddBrandServlet extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String brand=req.getParameter("brand");
		String Offer=req.getParameter("offer");
		String imageurl=req.getParameter("imageurl");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
			PreparedStatement ps=con.prepareStatement("insert into brand(brandname,offer,brandimage) values(?,?,?)");
			ps.setString(1, brand);
			ps.setString(2, Offer);
			ps.setString(3, imageurl);
			ps.executeUpdate();
			resp.sendRedirect("clothes.jsp");
		}
		catch (Exception e)
		{
			PrintWriter out=resp.getWriter();
			out.println(e);
		}
	}
}

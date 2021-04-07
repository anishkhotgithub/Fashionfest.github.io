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

@WebServlet(name="AddBannerImage",urlPatterns = "/AddBannerImage")
@MultipartConfig(maxFileSize = 9999999999L)
public class AddBannerImage extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String brandname=req.getParameter("brandname");
		String Bimage1=req.getParameter("bimage1");
		String Bimage2=req.getParameter("bimage2");
		String Bimage3=req.getParameter("bimage3");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
			PreparedStatement ps=con.prepareStatement("insert into Bannmerimage(Offer,Bimage1,Bimage2,Bimage3) values(?,?,?,?)");
			ps.setString(1, brandname);
			ps.setString(2, Bimage1);
			ps.setString(3, Bimage2);
			ps.setString(4, Bimage3);
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

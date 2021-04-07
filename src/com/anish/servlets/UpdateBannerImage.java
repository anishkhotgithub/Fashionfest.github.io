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

@WebServlet(name="UpdateBannerImage",urlPatterns = "/UpdateBannerImage")
public class UpdateBannerImage extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int bannerid=Integer.parseInt(req.getParameter("bannerid"));
		String offer=req.getParameter("offer");
		String bimage1=req.getParameter("bimage1");
		String bimage2=req.getParameter("bimage2");
		String bimage3=req.getParameter("bimage3");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
			PreparedStatement ps=con.prepareStatement("update bannmerimage set Offer=?,bimage1=?,bimage2=?,bimage3=? where bannerid=?");
			ps.setString(1, offer);
			ps.setString(2, bimage1);
			ps.setString(3, bimage2);
			ps.setString(4, bimage3);
			ps.setInt(5, bannerid);
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

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

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		//Take the id which is coming from book.jsp page
				//using url rewriting technique
				int clothesid=Integer.parseInt(req.getParameter("clothesid"));
				
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
					PreparedStatement ps=con.prepareStatement("Delete from clothes where clothesid=?");
					ps.setInt(1, clothesid);
					ps.executeUpdate();
					
					PrintWriter out=resp.getWriter();
					out.println(""
							+ "<script>"
							+ "alert('clothe Deleted Successfully!!!');"
							+ "window.location='clothes.jsp';"
							+ "</script>");
				}
				catch(Exception e)
				{
					System.out.println(e);
				}
	}
}
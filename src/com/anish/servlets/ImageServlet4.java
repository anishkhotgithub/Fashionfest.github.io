package com.anish.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="ImageServlet4",urlPatterns = "/ImageServlet4")
public class ImageServlet4 extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int clothesid=Integer.parseInt(req.getParameter("id"));//1
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
			PreparedStatement ps=con.prepareStatement("select image4 from clothes where clothesid=?");
			ps.setInt(1, clothesid);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				Blob blob=rs.getBlob("image4");
				byte arr[]=blob.getBytes(1, (int)blob.length());
				resp.getOutputStream().write(arr);
			}
		}
		catch(Exception e)
		{
			//resp.getWriter().print(e);
			PrintWriter out=resp.getWriter();
			out.print(e);
			
		}
	}
}
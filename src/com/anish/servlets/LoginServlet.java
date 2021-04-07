package com.anish.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anish.model.Users;


@WebServlet(name="LoginServlet",urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Users u=new Users();
		u.setEmail(req.getParameter("email"));
		u.setPassword(req.getParameter("password"));
		
		try
		{
			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
			PreparedStatement ps=con.prepareStatement("select * from users where email=? and password=?");
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getPassword());
			ResultSet rs=ps.executeQuery();

			PrintWriter out=resp.getWriter();
			if(rs.next()) 
			{
				u.setEmail(rs.getString("email"));
				u.setUid(rs.getInt("uid"));
				u.setRole(rs.getString("role"));
				u.setName(rs.getString("name"));				
				HttpSession hs=req.getSession();
				//hs.setMaxInactiveInterval(60*2);
				hs.setAttribute("u", u);

				Cookie ck1=new Cookie("un", u.getEmail());
				Cookie ck2=new Cookie("pwd", u.getPassword());
				
				ck1.setMaxAge(30);
				ck2.setMaxAge(30);
				
				resp.addCookie(ck1);
				resp.addCookie(ck2);
				
				
				out.println(""
						+ "<script>"
						+ "alert('Welcome "+u.getEmail()+"');"
						+ "window.location='clothes.jsp';"
						+ "</script>");
							}
			else
			{
				out.println(""
						+ "<script>"
						+ "alert('Incorrect email or password');"
						+ "window.location='login.jsp';"
						+ "</script>");
			}
		}
		catch(Exception e)
		{
			PrintWriter out=resp.getWriter();
			out.println(e);
		}
	}
}
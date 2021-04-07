package com.anish.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.anish.email.*;

@WebServlet(name="RegistrationServlet",urlPatterns = "/RegistrationServlet")
public class RegistrationServlet extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
			PreparedStatement ps=con.prepareStatement("insert into users(name,email,password) values(?,?,?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			/* ps.setString(4, "user"); */
			ps.executeUpdate();
			
			Email em=new Email(email,"Registerd Successfully!!!", "Welcome to Books Website!!!");
			em.sendEmail();			
			resp.sendRedirect("login.jsp");
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
	}
}
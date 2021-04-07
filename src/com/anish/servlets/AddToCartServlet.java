package com.anish.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.anish.model.*;

@WebServlet(name="AddToCartServlet",urlPatterns = "/AddToCartServlet")
public class AddToCartServlet extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession hs  = req.getSession();
		
		int clothesid      = Integer.parseInt(req.getParameter("id"));
		/* int quantity = Integer.parseInt(req.getParameter("qty")); */
		int uid = ((Users)hs.getAttribute("u")).getUid();
		String brandname=req.getParameter("brandname");
		String size=req.getParameter("inlineRadioOptions");
		float price      = Float.parseFloat(req.getParameter("pricevalue"));
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
			
			PreparedStatement ps1 = con.prepareStatement("select * from cartitems where clothesid=? and userid=?");
			ps1.setInt(1,clothesid);
			ps1.setInt(2,uid);
			
			ResultSet rs=ps1.executeQuery();
			if(rs.next())
			{
				PrintWriter out=resp.getWriter();
				out.println(""
						+ "<script>"
						+ "alert('item is already there in the cart. Goto cart page and check');"
						+ "window.location='cart.jsp';"
						+ "</script>");
			}
			else
			{
				PreparedStatement ps2 = con.prepareStatement("insert into cartitems (clothesid,userid,price_quantity,size) values(?,?,?,?)");
				ps2.setInt(1, clothesid);
				ps2.setInt(2, uid);
				ps2.setInt(3, 1);
				ps2.setString(4, size);
				ps2.executeUpdate();
			
				PrintWriter out=resp.getWriter();
				
				out.println(""
					+ "<script>"
					+ "alert('cart item added successfully!!!');"
					+ "window.location='cart.jsp';"
					+ "</script>");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
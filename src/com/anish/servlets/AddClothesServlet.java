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

@WebServlet(name="AddClothesServlet",urlPatterns = "/AddClothesServlet")
@MultipartConfig(maxFileSize = 9999999999L)
public class AddClothesServlet extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String brandname=req.getParameter("brandname");
		String category=req.getParameter("category");
		float price=Float.parseFloat(req.getParameter("price"));
		float pricestrike=Float.parseFloat(req.getParameter("pricestrike"));
		String gender=req.getParameter("gender");
		String description=req.getParameter("description");
		Part part=req.getPart("image");
		InputStream is=part.getInputStream();
		Part part1=req.getPart("image2");
		InputStream is2=part1.getInputStream();
		Part part2=req.getPart("image3");
		InputStream is3=part2.getInputStream();
		Part part3=req.getPart("image4");
		InputStream is4=part3.getInputStream();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Fashionfest","root","root");
			PreparedStatement ps=con.prepareStatement("insert into clothes(brandname,category,price,pricestrike,image,image2,image3,image4,status,gender,description) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, brandname);
			ps.setString(2, category);
			ps.setFloat(3, price);
			ps.setFloat(4, pricestrike);
			ps.setBlob(5, is);
			ps.setBlob(6, is2);
			ps.setBlob(7, is3);
			ps.setBlob(8, is4);
			ps.setString(9, "A");
			ps.setString(10, gender);
			ps.setString(11, description);
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
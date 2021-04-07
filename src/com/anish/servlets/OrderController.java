package com.anish.servlets;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.model.PaymentOrder;
import com.instamojo.wrapper.model.PaymentOrderResponse;

@WebServlet("/OrderController")
public class OrderController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Float price=Float.parseFloat(req.getParameter("price"));
		 try 
	       {
	           ApiContext context = ApiContext.create("test_Us0aLWa5CQJrsInEP1wrz5IicxyCTbqEROu", "test_LEP4LxF6MCZOODhVHE6dT5zZQkJVpAEXXsURIYYRp2enoKdgzVgDU43jCQmGeFgkYNS9lPdnLDHi4seJyBSH3ZYc01SajC9RcsCOq29hooi9AY2dYig4GBHqCRh", ApiContext.Mode.TEST);
	           Instamojo api = new InstamojoImpl(context);

	           PaymentOrder order = new PaymentOrder();
	           order.setName("Anish");
	           order.setEmail("anishkhot2000@gmail.com");
	           order.setPhone("9967373113");
	           order.setCurrency("INR");
	           order.setAmount((double)price);
	           order.setDescription("Description");
	           order.setRedirectUrl("https://www.google.com");
	           order.setWebhookUrl("https://www.google.com");
	           order.setTransactionId(UUID.randomUUID().toString());

	           PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
	           resp.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
	       }
	       catch (Exception e) 
	       {
	           System.out.println(e);
	       }
	}
}
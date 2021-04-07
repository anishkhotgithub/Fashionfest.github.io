<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/Fashionfest"
					   user="root"
					   password="root"
					   var="con"/>
					
	<!-- Display only particular book -->
	<!-- Take bookid from last page books.jsp using ${param.bookid} -->   
	<sql:query var="rs" dataSource="${con}">
		select * from cartitems where userid=?
		<sql:param>${u.uid}</sql:param>
	</sql:query>
	
	
	<c:forEach items="${rs.rows}" var="cartdetails">
	<sql:query var="rs2" dataSource="${con}">
		select * from clothes where clothesid=?
		<sql:param>${cartdetails.clothesid}</sql:param>
	</sql:query>
			
	<div class="container">
		<div class="row">
			<c:forEach items="${rs2.rows}" var="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<img src="ImageServlet?id=${row.clothesid}" class="col-lg-12"/>	<hr>
				</div>
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<h3 class="col-lg-12">${row.name}</h3>
					<h5 class="col-lg-12">${row.gender}</h5>
					<h5 class="col-lg-12">${cartdetails.size}</h5>
					<h5 class="col-lg-12">Rs. ${row.price}/per</h5>
					<h5 class="col-lg-12">Total Price: ${row.price*cartdetails.price_quantity}</h5>
					
					<form action="UpdateCartServlet" method="get">
						<input type="text" name="cartid" value="${cartdetails.cartid}" id="cid" hidden/>
						Quantity: <input type="number"  name="qty" value="${cartdetails.price_quantity}" id="qty"/>
						<input type="submit" class="btn btn-success btn-block" value="Update Cart">
					</form>
					<a href="placeorder.jsp?brandname=${row.brandname}&inlineRadioOptions=${cartdetails.size}&pricevalue=${row.price*cartdetails.price_quantity}" class="btn btn-warning btn-block">Place Order</a>
					 <a href="OrderController?price=${row.price*cartdetails.price_quantity}" class="btn btn-warning btn-block">Place Order</a>
					<c:if test="${u.role=='admin'}">
						<a href="DeleteServlet?bookid=${row.bookid}" class="btn btn-danger btn-block">Delete</a>
						<a href="edit.jsp?bookid=${row.bookid}" class="btn btn-warning btn-block">Edit</a>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>	
	</c:forEach>    
</body>
</html>
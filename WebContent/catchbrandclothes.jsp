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
	<sql:query var="rs" dataSource="${con}">
		select * from clothes where brandname=?
		<sql:param>${param.id}</sql:param>
	</sql:query>
	<div class="">
		<div class="row">
			<c:forEach items="${rs.rows}" var="row">
				<div class=m-0>	
					<div class="card" style="width: 16rem; margin-top:10px">
						<center><a href="imageslideshow.jsp?id=${row.clothesid}"><img src="ImageServlet?id=${row.clothesid}" onmouseover="this.src='ImageServlet2?id=${row.clothesid}'" onmouseout="this.src='ImageServlet?id=${row.clothesid}'" style="width: 250px;height: 300px;" class="card-img-top" alt="..."></a></center>
							<div class="card-body">
								<h5 class="card-title">${row.brandname}</h5>
								<p class="card-text">${row.category}</p>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">RS.${row.price}</li>
							</ul>
							<div class="card-body">
								<a href="AddToCartServlet?id=${row.clothesid}" class="btn btn-primary">Add To Cart</a>
								<a href="#" class="btn btn-success">Buy</a>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>